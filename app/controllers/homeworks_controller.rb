class HomeworksController < ApplicationController
  before_action :find_lesson
  before_action :find_homework, except: [:create]
  def create
    @homework = @lesson.homeworks.create(homework_params)
    redirect_to @lesson
  end

  def update
    @homework = Homework.find(params[:id])
    @homework.update(homework_params)
    redirect_to @lesson
  end

  def destroy
    @homework.destroy
    redirect_to @lesson
  end

  private
  def find_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def find_homework
    @homework = Homework.find(params[:id])
  end

  def homework_params
    params.require(:homework).permit(:lesson_id, :student_id, :link)
  end
end
