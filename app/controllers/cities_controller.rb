class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_city, only: [:edit, :update]
  before_action :set_keepers, only: [:create, :update]

  def index
    @cities = policy_scope(City).alphabetize
  end

  def new
    @city = City.new
    authorize @city
  end

  def create
    @city = City.new(city_params)
    authorize @city
    @keepers.each { |keeper| @city.keepers << User.find(keeper.to_i) } if @keepers
    if @city.save
      flash[:notice] = "Yay! You succcesfully added #{@city.name}! 🍪"
      redirect_to city_spots_path(@city)
    else
      flash.now[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :new
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      @city.keepers.destroy_all
      @keepers.each { |keeper| @city.keepers << User.find(keeper.to_i) }
      flash[:notice] = "You updated #{@city.name}! ⭐️"
      redirect_to city_spots_path(@city)
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
    params.require(:city).permit(:name, :cover, :country_id)
  end

  def set_keepers
    @keepers = params[:city][:keeper_ids]
  end
end
