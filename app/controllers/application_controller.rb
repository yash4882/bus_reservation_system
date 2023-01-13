class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  add_flash_types :danger, :info, :warning, :success, :messages
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :email, :password, :contact, :role_id, :age, :gender])
    devise_parameter_sanitizer.permit(:sign_in,keys: [:login, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,keys: [:contact, :username, :name, :email, :password_confirmation, :current_password])
  end

end

