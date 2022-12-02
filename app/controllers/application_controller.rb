class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :danger, :info, :warning, :success, :messages
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :contact, :role_id, :age, :gender])
  end

end

