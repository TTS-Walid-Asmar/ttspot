class RegistrationsController < ApplicationController
  def create
    @registration = Registration.new(registration_params)
  end
  private
  def registration_params
    params.require(:registration).permit(:course_id, :user_id)
  end
end
