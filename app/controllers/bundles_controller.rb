class BundlesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @bundle = Bundle.find(params[:id])
    @role = session[:role]
    @show_buy_button = @role == 'guest'
  end
end
