class PlacesController < ApplicationController
  def index
    places = Place.all
    render json: places, status: 200
  end

  def create
    place = Place.new(place_params)
    if place.save
      render json: place, status: 201
    else
      render json: place.errors, status: 422
    end
  end

  private
    def place_params
      params.require(:place).permit(:name)
    end
end
