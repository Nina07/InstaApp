class CommentsController < ApplicationController
    before_action :find_post, only: [:create]

    def create
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id

        if @comment.save
            flash[:notice] = "You commented the hell out of that post!"
        else
            flash[:alert] = "Check the comment form, something went horribly wrong."
        end
        redirect_to root_path
    end

    private
    def find_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end
end
