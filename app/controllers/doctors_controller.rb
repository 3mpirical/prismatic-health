class DoctorsController < ApplicationController
  before_action :get_doctor, only: [:show, :destroy]
  skip_before_action :authenticate_patient!
  skip_before_action :authenticate_doctor!, only: [:index ,:show]


  def index
    @doctors = Doctor.all()
  end

  def show_doctor_apps
      @appointment = current_doctor.appointments.find(params[:id])
  end

  def show
  end

  def destroy
    if(current_doctor == @doctor)
      current_doctor.destroy()
      redirect_to("/")
    else
      redirect_to("/")
    end
  end

  private
    def get_doctor
      @doctor = current_doctor
    end

end
