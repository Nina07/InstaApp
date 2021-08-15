class UsersController < ApplicationController
  def show
    @posts = current_user.posts.order(created_at: :desc) if user_signed_in?
  end

  def return_user_likes_and_comments
    @posts = current_user.find_up_voted_items # will return a list of posts the user has liked
    @posts.each do |post|
      post.comments # will return the comments associated with every post
    end
  end
end
