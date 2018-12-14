class NewsPostsController < ApplicationController

  layout 'admin'

  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new( post_params )
    @post.postable = League.first
    if @post.save
      redirect_to quizmaster_news_post_path( @post ), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @post = Post.new
  end

  def update
    if @post.update( post_params )
      redirect_to quizmaster_news_posts_path, notice: 'Post was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    if @post.destroy
      redirect_to quizmaster_news_posts_path, notice: 'News post was successfully destroyed.'
    else
      redirect_to quizmaster_news_item_path( @post ),
        alert: @post.errors.full_messages.join( '<br>'.html_safe )
    end
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title, :body
    )
  end

end
