class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def authenticate_user!
    if session[:user_id]
       # set current user object to @current_user object variable
      @current_user = User.find session[:user_id] 
      return true 
    else
      redirect_to(:controller => 'sessions', :action => 'new')
      return false
    end
  end

  private
  def after_sign_in_path
    products_path
  end

  def after_sign_up_path_for
    products_path
  end

  def user_signed_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]    
  end

  helper_method :user_signed_in?
end
