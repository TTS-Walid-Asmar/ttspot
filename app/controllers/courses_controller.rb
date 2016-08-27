class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def new
    @course = Course.new
  end

  def index
    @courses = current_user.active_courses
    @inactive_courses = current_user.inactive_courses
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.create(course_params)
    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course
    else
      render :new
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:season, :description, :instructor_id, :starts, :ends, :active, :city_id, :offering_id, :street_address, :zip_code, :start_time, :end_time, :office_name)
  end
end
