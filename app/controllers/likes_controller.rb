class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = current_user
    @like = @user.likes.create(like_params)
    p "this went thru"
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
    params.require(:like).permit(:liked, :post_id, :likeable_id, :likeable_type)
  end
end
