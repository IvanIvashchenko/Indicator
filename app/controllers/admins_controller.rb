class AdminsController < ApplicationController
  respond_to :html

  def new
    redirect_to after_sign_up_path_for if user_signed_in?
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(
      params.require(:admin).permit(
        :email, :password, :password_confirmation, :firstname,
        :lastname, :avatar, :photo, :birth_date
      )
    )
    if @admin.save
      session[:user_id] = @admin.id
      respond_with @admin, location: after_sign_up_path_for
    else
      respond_with @admin, location: sign_up_admin_path
    end
  end
end
