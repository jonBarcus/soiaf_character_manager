class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # method to recognize the current user by an
  # id number
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # determines whether a user is logged in
  # used for conditionals in content display
  def logged_in?
    current_user.present?
  end

  # checks to see if user is an admin
  # used for conditionals in content display
  def require_admin
    if logged_in? && current_user.admin
      return true
    else
      flash[:error] = "Admin rights required"
      redirect_to(root_path)
    end
  end

  helper_method(:current_user, :logged_in?)

end
