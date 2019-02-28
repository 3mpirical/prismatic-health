class DoctorsController < ApplicationController
  before_action :get_doctor, only: [:show, :destroy]
  skip_before_action :authenticate_patient!
  skip_before_action :authenticate_doctor!, only: [:index ,:show]


  def index
    @doctors = Doctor.all()
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
      @doctor = Doctor.find(params[:id])
    end

end
