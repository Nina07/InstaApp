class PostsController < ApplicationController
    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "Post created successfully!"
        else
            flash[:notice] = "Please upload the image first! Post creation failed."
        end
        redirect_to root_path
    end

    def like
        @post = Post.find(params[:id])
        if @post.liked_by current_user
            respond_to do |format|
              format.html { redirect_to :root_path }
              format.js
            end
        end
    end

    private
    def post_params
        params.require(:post).permit(:description, :image, :user_id)
    end
end
