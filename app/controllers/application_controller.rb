class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ping_api

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [
      :username,
      :email,
      :password,
      :password_confirmation,
      :current_password
    ]
  end

  def ping_api
    unless JSON.parse(RestClient.get "#{BASE_URI}/ping").fetch("response") == "PONG"
      raise ActionController::RoutingError.new('404: API could not be reached.')
    end
  end
end
