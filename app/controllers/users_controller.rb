class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @friendship = Friendship.new
    @users = User.all
  end

  def edit
  end

  def update
  end

  def show
  end
end
