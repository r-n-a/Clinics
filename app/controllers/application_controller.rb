class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception
  
	 def after_sign_in_path_for(resource)
		if current_user.clinics.all .count>0
			procedures_path(current_user.clinics.first)
		else
			new_clinic_path
		end
	end
	
	def after_sign_out_path_for(resource_or_scope)
		root_url
	end
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << :username
	end
  
end
