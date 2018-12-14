module NewsPosts
  class StatusesController < ApplicationController

    def update
      @post = Post.find( params[:news_post_id] )
      @post.status = params[:status]
      if @post.save
        redirect_to quizmaster_news_post_path( @post ),
          notice: "News post status is now #{ @post.status }."
      else
        redirect_to quizmaster_news_post_path( @post ),
          alert: @post.errors.full_messages.join( '<br>'.html_safe )
      end
    end

  end
end
