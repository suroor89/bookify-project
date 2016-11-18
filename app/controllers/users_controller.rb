class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @books = @user.books
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.firstname}!"
      redirect_to users_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User #{@user.firstname} deleted successfully."
    redirect_to root_url
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
