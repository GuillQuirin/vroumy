class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
  	flash[:danger] = exception.message
  	if request.env['HTTP_REFERER'].present?
  		redirect_to :back
  	else
  		redirect_to root_url
  	end
  end

  protected 

  def configure_permitted_parameters
  	added_attrs = %i(pseudo email password password_confirmation remember_me)
  	devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  	devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  def current_ability
  	@current_ability ||= Ability.new(current_utilisateur)
  end
end
