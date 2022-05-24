class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_slug

  def index
    @users = User.all
    authorize @users    
  end

  def show
    authorize @user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    @user.update(user_params)

    respond_to do |format|
      format.html { redirect_to user_path(@user.id), notice: 'User was successfully updated!' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_slug
    if @user
      @user.set_slug
    end
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :bio, :slug, :avatar)
  end

end
