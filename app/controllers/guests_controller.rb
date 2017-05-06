class GuestsController < ApplicationController
  respond_to :html

  def new
    redirect_to after_sign_up_path_for if user_signed_in?
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(
      params.require(:guest).permit(:email, :password, :password_confirmation)
    )
    if @guest.save
      session[:user_id] = @guest.id
      respond_with @guest, location: after_sign_up_path_for
    else
      respond_with @guest, location: sign_up_guest_path
    end
  end
end
