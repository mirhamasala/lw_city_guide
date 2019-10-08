class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @cities = policy_scope(City).alphabetize
  end

  def new
    @city = City.new
    authorize @city
  end

  def create
    @city = City.create(city_params)
    authorize @city
    if @spot.save
      flash[:notice] = "Yay! You succcesfully added #{@city.name}! 🍪"
      redirect_to cities_path
    else
      flash.now[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :new
    end
  end

  private

  def city_params
    params.require(:city).permit(:name, :country, :photo)
  end
end
