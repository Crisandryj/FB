class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.authored_posts.create(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
