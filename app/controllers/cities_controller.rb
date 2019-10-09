class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_city, only: [:edit, :update]

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
    if @city.save
      flash[:notice] = "Yay! You succcesfully added #{@city.name}! 🍪"
      redirect_to cities_path
    else
      flash.now[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :new
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      flash[:notice] = "You updated #{@city.name}! ⭐️"
      redirect_to cities_path
    else
      flash.now[:alert] = "Oops! Something went wrong. Please, try again. 🌈"
      render :edit
    end
  end

  private

  def set_city
    @city = City.find(params[:id])
    authorize @city
  end

  def city_params
    params.require(:city).permit(:name, :country, :photo, :remote_photo_url)
  end
end
