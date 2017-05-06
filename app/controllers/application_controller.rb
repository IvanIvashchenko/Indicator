class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def authenticate_user!
    if session[:user_id]
      # TODO: rewrite
      # set current user object to @current_user object variable
      case session[:role]
      when 'admin'
        @current_user = Admin.find session[:user_id]
      when 'owner'
        @current_user = Owner.find session[:user_id]
      when 'guest'
        @current_user = Guest.find session[:user_id]
      end
      true
    else
      redirect_to(controller: 'sessions', action: 'new')
      false
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
