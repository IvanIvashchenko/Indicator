class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def new
    build_resource()
    respond_with self.resource
  end

  def create
    build_resource(sign_up_params)
    if resource.save
      sign_in(resource)
	    respond_with resource, :location => after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def update
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_up_path_for(resource)
    products_path
  end
end