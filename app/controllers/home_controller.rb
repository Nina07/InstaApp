class HomeController < ApplicationController
  def index
    if current_user
      @posts = Post.order(created_at: :desc)
    else
      redirect_to new_user_session_path
    end
  end
end
