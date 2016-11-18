class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def ensure_correct_user
    redirect_to root_path unless is_current_user?(@user)
  end
end
