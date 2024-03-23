class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    comment.post_id = params[:post_id]
    if comment.save
      redirect_to post_comments_path(comment.post_id)
    else
      @post = comment.post
      @comment = @post.comments.build
      render "posts/show"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    redirect_to post_path(comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
