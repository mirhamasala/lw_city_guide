class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_city, only: [:show]

  def index
    @cities = policy_scope(City)
  end

  def show
    @city.spots.where.not(latitude: nil, longtitude: nil)

    @markers = @city.spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { spot: spot }),
        image_url: helpers.asset_url("placemark_#{spot.category.name}.png")
      }
    end
  end

  private

  def set_city
    @city = City.find(params[:id])
    authorize @city
  end
end
