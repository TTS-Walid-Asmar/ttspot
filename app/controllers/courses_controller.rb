class CoursesController < ApplicationController
  def new
    @course = Course.new
  end
  def index
    @course = Course.all
  end
  def show
    @course = Course.find(params[:id])
  end
  def edit
    @course = Course.find(params[:id])
  end
end
