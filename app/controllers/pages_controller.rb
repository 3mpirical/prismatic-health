class PagesController < ApplicationController
  skip_before_action :authenticate_patient!
  skip_before_action :authenticate_doctor!
  def home
  end
end
