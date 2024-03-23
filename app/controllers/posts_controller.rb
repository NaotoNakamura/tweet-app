class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @posts = Post.all
    if @post.save
      redirect_to posts_path
    else
      render :index
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to root_path
  end

  private
  
  def post_params
    params.require(:post).permit(:body)
  end
end
