class ApplicationController < ActionController::Base
    before_action :authenticate_patient!
    before_action :authenticate_doctor!
    before_action :configure_permitted_params, if: :devise_controller?

    private
        def configure_permitted_params
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
        end

end
