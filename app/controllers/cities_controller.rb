class CitiesController < ApplicationController
  load_and_authorize_resource
  def new
    @city = City.new
  end

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def create
    @city.create(city_params)
    if @city.save
      redirect_to @city, notice: "#{@city.name} was successfully created!"
    else
      render :new
    end
  end
  def edit
    @city = City.find(params[:id])
  end
  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      redirect_to @city, notice: "#{@city.name} was successfully updated!"
    else
      render :edit
    end
  end
  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path, notice: "#{@city.name} was deleted"
  end
  private
  def city_params
    params.require(:city).permit(:name)
  end
end
