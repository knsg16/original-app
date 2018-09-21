class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Banken
  protect_from_forgery
  rescue_from Banken::NotAuthorizedError, with: :user_not_authorized
  
  def user_not_authorized(exception)
    loyalty_name = exception.loyalty.class.to_s.underscore
    flash[:error] = t "#{loyalty_name}.#{exception.query}", scope: "banken", default: :default
    redirect_to(request.referrer || root_path)
  end

  protected
 
  def configure_permitted_parameters
    added_attrs = [ :username, :email, :password, :password_confirmation　]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
