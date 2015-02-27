class UsersController < ApplicationController
  before_action :set_user, only:
  [:show, :profile_starter, :edit, :update, :destroy, :dashboard, :star, :unstar, :favorites]

  def dashboard
    @pending_friendships = Friendship.where(
      'friend_id = ? AND state = ?', current_user.id, 'pending')
  end

  def star
    @user.liked_by current_user
    redirect_to @user, notice: '#{@user.name} was added to your favorites!'
  end

  def unstar
    @user.unliked_by current_user
    redirect_to @user, notice: '#{@user.name} was removed from your favorites!'
  end

  def favorites
    @users = policy_scope(User)
  end

  # GET /users
  # GET /users.json
  def index
    @users = policy_scope(User).search(params[:search]).paginate(
      page: params[:page],
      per_page: 20)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @pending = pending_mentorship if pending_mentorship
    @approved_mentorship = approved_mentorship if approved_mentorship
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/:id/profile_starter
  def profile_starter
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Dont trust parameters from the internet, only allow the white list through.
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :background,
      :accomplishments, :professional_summary, :personal_statement, :role,
      :admin, :company, :position, :graduating_class, :course, :available,
      :technologies, :hopes_for_mentorship, :hopes_for_future, :image_url)
  end

  def pending_mentorship
    Friendship.where(
      'friend_id = ? AND user_id = ? AND state = ?',
      current_user.id, params[:id], 'pending')
  end

  def approved_mentorship
    Friendship.where(
      'friend_id = ? AND user_id = ? AND state = ?',
      current_user.id, params[:id], 'approved')
  end
end
