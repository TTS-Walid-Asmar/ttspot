class InvitationsController < Devise::InvitationsController
  before_action :set_course_new
  private
  def set_course_new
    @course = params[:course_id]
  end
end
