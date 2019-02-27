class DoctorsController < ApplicationController
  skip_before_action :authenticate_patient!
  skip_before_action :authenticate_doctor!, only: [:show]
  def edit
  end

  def show
  end
end
