class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :show_navbar

  def show_navbar
    @show_navbar = true
  end

  protected
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  helper_method :current_user
end
