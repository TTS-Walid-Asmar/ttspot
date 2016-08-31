class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user
  
  def authenticate_inviter!
    authenticate_instructor!(:force => true)
  end

  def current_user
    current_student || current_instructor
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type, registrations_attributes: [:id, :course_id, :_destroy]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :type, registrations_attributes: [:id, :course_id, :_destroy]])
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :type, registrations_attributes: [:id, :course_id, :_destroy]])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :type, registrations_attributes: [:id, :course_id, :_destroy]])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, notice: "Sorry, but you cannot access that page."
  end

end
