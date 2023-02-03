class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
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
  end

  private

  def friendship_params
    params.require(:friendship).permit(:followee_id,:follower_id, :accepted)
  end
end
