# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name friendly_url email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:friendly_url])

    # devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
