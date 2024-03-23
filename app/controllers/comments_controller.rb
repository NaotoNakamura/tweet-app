class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    comment.post_id = params[:post_id]
    if comment.save
      redirect_to post_comments_path(comment.post_id)
    else
      p "failed"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
