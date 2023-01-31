class UsersController < ApplicationController
  def new
    @user = User.new
    @friendship = Friendship.new
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
  end

  def show
  end
end
