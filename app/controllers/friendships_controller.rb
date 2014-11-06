class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:friend_id])
    @friendship = Friendship.new(friend_id: params[:friend_id], user_id: current_user.id, state: "pending")
    if @friendship.save
      flash[:notice] = "Request sent!"
      redirect_to root_path
    else
      flash[:notice] = "Unable to send request."
      redirect_to user_path(user)
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Succesfully deleted relationship"
    redirect_to root_path
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.accept
    flash[:notice] = "Mentorship approved"
    redirect_to root_path
  end

end
