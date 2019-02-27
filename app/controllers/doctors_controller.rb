class DoctorsController < ApplicationController
  skip_before_action :authenticate_patient!
  skip_before_action :authenticate_doctor!, only: [:index ,:show]


  def index
    @doctors = Doctor.all()
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

end
