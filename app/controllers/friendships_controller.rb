class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    raise params.inspect
    @user = current_user
    @friendship = Friendship.create(friendship_params)
    if @friendship.save
      redirect_to @friendship
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def show
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(params_update)
    if @friendship.save
      redirect_to @friendship
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:followee_id,:follower_id, :accepted, :requestee_id, :requestor_id)
  end

  def params_update
    params.permit(:accepted)
  end
end
