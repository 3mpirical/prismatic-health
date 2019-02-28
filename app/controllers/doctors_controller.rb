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
      ## currrent_doctor is not used here because we want to
      ## conditionally check if our current doctor is the doctor
      ## in our route parameters. The links to edit/delete routes
      ## displays (or not) as a result of this.
      @doctor = Doctor.find(params[:id])
    end

end
