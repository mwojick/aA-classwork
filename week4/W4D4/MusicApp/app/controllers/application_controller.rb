class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      flash[:errors] = ["You must be logged in to view this"]
      redirect_to new_session_url
    end
  end

  def log_out_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

end
