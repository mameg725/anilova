class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?


	def after_sign_in_path_for(resource)
		users_mypage_path(current_user.friendly_url)
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :friendly_url, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:friendly_url])
	end

end
