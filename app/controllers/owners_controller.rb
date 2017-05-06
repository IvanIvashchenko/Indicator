class OwnersController < ApplicationController
  respond_to :html

  def new
    redirect_to after_sign_up_path_for if user_signed_in?
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(
      params.require(:owner).permit(
        :email, :password, :password_confirmation, :shop, :avatar
      )
    )
    if @owner.save
      session[:user_id] = @owner.id
      respond_with @owner, location: after_sign_up_path_for
    else
      respond_with @owner, location: sign_up_owner_path
    end
  end
end
