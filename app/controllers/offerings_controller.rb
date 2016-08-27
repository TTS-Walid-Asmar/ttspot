class OfferingsController < ApplicationController
  load_and_authorize_resource

  def new
    @offering = Offering.new
  end

  def index
    @offerings = Offering.all
    @offering = Offering.new
  end

  def show
    @offering = Offering.find(params[:id])
  end

  def edit
    @offering = Offering.find(params[:id])
  end
  def create
    @offering.create(offering_params)
    redirect_to @offering
  end
  def update
    @offering = Offering.find(params[:id])
    @offering.update(offering_params)
    redirect_to @offering
  end
  def destroy
    @offering = Offering.find(params[:id])
    @offering.destroy
    redirect_to offerings_path
  end
  private
  def offering_params
    params.require(:offering).permit(:title)
  end
end
