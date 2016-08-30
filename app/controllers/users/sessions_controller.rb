class Users::SessionsController < Devise::SessionsController
  before_filter :redirect_if_logged_in

  def create
    params[:user][:email] = params[:user][:email].downcase
    user = User.find_by(email: params[:user][:email])
    if user.try(:valid_password?, params[:user][:password])
      if user.is_a? Student
        sign_in_student(user)
      else
        sign_in_instructor(user)
      end
    else
      super
    end
  end

private

  def redirect_if_logged_in
    redirect_to after_sign_in_path_for(current_user) if current_user
  end

  def sign_in_instructor(user)
    if user.is_a? Instructor
      request.env["devise.mapping"] = Devise.mappings[:instructor]
    end
    sign_in user
    redirect_to root_path, notice: 'Signed in successfully.'
  end

  def sign_in_student(user)
    request.env["devise.mapping"] = Devise.mappings[:student]
    sign_in user
    redirect_to root_path, notice: 'Signed in successfully.'
  end
end
