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

  def show
    @friend = Friend.find(params[:id])
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    @friend.update_attributes!(friend_params)

    redirect_to friends_path
  end

  def destroy
    @friend = Friend.find(params[:id]).delete

    redirect_to friends_path
  end

  private
  def friend_params
    params.require(:friend).permit(:first_name, :last_name)
  end
end