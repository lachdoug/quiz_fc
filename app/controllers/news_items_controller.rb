class NewsItemsController < ApplicationController

  layout 'admin'

  before_action :set_post, only: [:edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new( post_params )
    @post.postable = League.first
    if @post.save
      redirect_to quizmaster_news_items_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @post = Post.new
  end

  def update
    if @post.update( post_params )
      redirect_to quizmaster_news_items_path, notice: 'Post was successfully updated.'
    else
      render :new
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
