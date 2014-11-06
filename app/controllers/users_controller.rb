class UsersController < ApplicationController
  before_action :set_user, only: [:show, :profile_starter, :edit, :update, :destroy, :dashboard, :star, :unstar, :history]

  # def star
  #   @user.liked_by current_user
  #   redirect_to @user
  # end

  # def unstar
  #   @user.unliked_by current_user
  #   redirect_to @user
  # end

  def dashboard
    @users = policy_scope(User).search(params[:search]).paginate(page: params[:page], per_page: 5)
    @pending_friendships = Friendship.where("friend_id = ? AND state = ?", current_user.id, "pending")
  end

  # GET /users
  # GET /users.json
  def index
    @users = policy_scope(User).search(params[:search]).paginate(page: params[:page], per_page: 20)
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :background, :accomplishments, :professional_summary, :personal_statement, :role, :admin, :company, :position, :graduating_class, :stack, :available)
    end
end

