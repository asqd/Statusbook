class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Strong parameters for Devise

  private

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, 
  		          :password_confirmation, :remeber_me, 
  				  :first_name, :last_name, :profile_name) }
  end
end
