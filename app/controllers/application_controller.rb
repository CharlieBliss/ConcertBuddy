class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  # before_action :require_current_user


  def require_current_user
    unless current_user
      flash[:alert] = "You must be logged in to access this page"
      redirect_to root_path
    end
  end

end
