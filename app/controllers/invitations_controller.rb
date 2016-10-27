class InvitationsController < Devise::InvitationsController
  before_action :set_course_new
  def after_invite_path_for(_)
    root_path
  end
  def set_course_new
    @course = params[:course_id].to_i
  end
end
