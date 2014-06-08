class FriendsController < ApplicationController

  def index
    @friend = Friend.new
    @friends = Friend.all
  end

  def create
    @friend = Friend.create(friend_params)
    if @friend.save
      redirect_to friends_path
    else
      render :index
    end
  end

  private
  def friend_params
    params.require(:friend).permit(:first_name, :last_name)
  end
end