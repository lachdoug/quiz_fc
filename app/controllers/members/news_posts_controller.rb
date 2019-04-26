module Members
  class NewsPostsController < ApplicationController

    before_action :set_member, only: [:index, :show]
    before_action :set_news_post, only: [:show]

    def index
      @news_posts = @member.league.published_posts
    end

    def show
    end

    private

    def set_member
      @member = Profile.for( current_user ).members.find( params[:member_id] )
    end

    def set_news_post
      @news_post = Post.find( params[:id] )
    end

  end

end
