class AppointmentsController < ApplicationController
    skip_before_action :authenticate_doctor!

    def new
        @appointment = Appointment.new()
    end

    def edit
        
    end

    def create
        
    end

    def update
        
    end

    def destroy
        
    end

    private
end
