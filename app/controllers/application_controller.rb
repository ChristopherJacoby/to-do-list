class ApplicationController < ActionController::Base

  private

  def require_signin
    unless current_user
      session[:requested_url] = request.url
      redirect_to signin_url, alert: "Please sign in"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user
  helper_method :current_user?

end
