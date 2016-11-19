class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  protected
  def check_logged_in_user
    unless logged_in?
      flash[:warning] = "Unauthorized access. Please log in."
      redirect_to login_url
    end
  end

  def ensure_correct_user
    unless is_current_user?(@user)
      flash[:info] = "Unauthorized access. You can only edit your own reading list."
      redirect_to user_books_path(current_user)
    end
  end
end
