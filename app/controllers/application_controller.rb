class ApplicationController < ActionController::Base
    before_action :authenticate_patient!, except: [:sign_up, :sign_in]
    before_action :authenticate_doctor!, except: [:sign_up, :sign_in]
    before_action :configure_permitted_params, if: :devise_controller?
    before_action :get_institutions, if: :devise_controller? 

    protected
        def configure_permitted_params
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :institution_id, :avatar])
            devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :institution_id, :avatar])
        end

        def after_sign_in_path_for(resource)
            case(true)
            when(current_patient)
                return current_patient
            when(current_doctor)
                return current_doctor
            end
        end

        def after_update_path_for(resource)
            case(true)
            when(current_patient)
                return current_patient_path(resource)
            when(current_doctor)
                return current_doctor_path(resource)
            end
        end

        def get_institutions
            @institutions = Institution.all()
        end

end
