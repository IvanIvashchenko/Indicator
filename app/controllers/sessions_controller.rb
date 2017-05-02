class SessionsController < ApplicationController

  def new
    if user_signed_in?
      redirect_to after_sign_up_path_for
    end
  end

  def create
    # TODO:: rewrite this!!!
    user = Guest.find_by(email: params[:user][:email])
    role = 'guest'
    unless user
      user = Owner.find_by(email: params[:user][:email])
      role = 'owner'
    end
    unless user
      user = Admin.find_by(email: params[:user][:email])
      role = 'admin'
    end
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      session[:role] = role
      redirect_to after_sign_in_path
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end