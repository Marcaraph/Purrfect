class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
     # HERE WE ADD SOME PERMISSION TO DEVISE TO UPDATE USER_PROFILE. Because devise accept only email, password and password_confirmation by default
       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :city, :country, :zip_code, :phone_number, :adress, :email, :password, :current_password, :password_confirmation)}
       end
end
