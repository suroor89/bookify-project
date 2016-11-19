class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user
      log_in(@user)
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      flash[:success] = "Welcome back #{@user.firstname}!"
      redirect_to user_books_path(@user)
    else
      flash[:warning] = "Invalid email/password."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
