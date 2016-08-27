class LessonsController < ApplicationController
  load_and_authorize_resource

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new
  end
  def edit
    @lesson = Lesson.find(params[:id])
    @cohort = Course.find(@lesson.course)
  end
  def show
    @lesson = Lesson.find(params[:id])
  end
  def create
    @lesson = Lesson.create(lesson_params)
    if @lesson.save
      redirect_to lesson_path(@lesson)
    else
      render :new
    end
  end
  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to @lesson
    else
      render :new
    end
  end
  def destroy
    @course = Course.find(@lesson.course_id)
    @lesson.destroy
    redirect_to @course
  end
  private
  def lesson_params
    params.require(:lesson).permit(:title, :number, :instructor_id, :course_id, :public, :description, :entry)
  end
end
