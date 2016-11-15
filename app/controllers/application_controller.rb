class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :finance_person?
  add_flash_types :error

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def finance_person?
    !current_user.nil? && current_user.finance_person?
  end

end
