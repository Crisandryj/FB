class LikeController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = current_user
    @like = @user.likes.create(like_params)
    if @like.save
      redirect_to @like
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def like_params
    params.require(:like).permit(:liked, :post_id)
  end
end
