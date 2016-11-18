module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    current_user.is_a? User
  end

  def remember(user)
    # generate model attr remember_token and table field remember_digest
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by(id: user_id)
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def is_current_user?(user)
    current_user == user
  end

  def forget(user)
    # set remember_digest nil
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    # or reset_session
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
