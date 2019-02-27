class AppointmentsController < ApplicationController
    skip_before_action :authenticate_doctor!
    before_action :get_appointment, only: [:destroy, :edit, :update, :show]

    def show
    end

    def new
        @appointment = Appointment.new()
        @patient = current_patient
        @institutions = Institution.all()
    end

    def edit
        
    end

    def create
        if(!params[:doctor_id])
            @patient = current_patient
            @appointment = Appointment.new()
            @name = params[:name]
            @date = params[:date]
            @time = params[:time]
            @selected_institution = Institution.find(params[:institution_id])
            @institutions = Institution.all()
            @doctors = @selected_institution.doctors
            render(:new)
        else
            @appointment = Appointment.new(appointment_params())

            if(@appointment.save())
                redirect_to(patient_path(current_patient.id))
            else
                render(:new)
            end
        end
    end

    def update
        if(@appointment.update(appointment_params()))

            redirect_to(patient_path(current_patient.id))
        else
            render(:edit)
        end
            
    end

    def destroy
        @appointment.destroy()
        redirect_to(patient_path(current_patient.id))
    end

    private
        def get_appointment
            @appointment = current_patient.appointments.find(params[:id])
        end

        def appointment_params
            return {
                name: params[:name],
                date: params[:date],
                time: params[:time],
                patient_id: current_patient.id,
                doctor_id: params[:doctor_id],
                institution_id: params[:institution_id],
            }
        end
end
