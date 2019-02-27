class PatientsController < ApplicationController
  skip_before_action :authenticate_doctor!
  
  def edit
  end

  def show
  end
end
