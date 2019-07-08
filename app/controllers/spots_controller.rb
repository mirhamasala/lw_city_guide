class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def new
    @city = City.find_by_name("Barcelona")
    @spot = Spot.new
    authorize @spot
  end

  def create
    @user = User.find(1)
    @city = City.find(params[:city_id])
    @spot = Spot.new(spot_params)
    @spot.user = @user
    @spot.city = @city
    @spot.save
    authorize @spot

    if @spot.save
      redirect_to @spot
    else
      render :new
    end
  end

  def show
    authorize @spot
    @city = City.find_by_name("Barcelona")
  end

  def edit
    authorize @spot
  end

  def update
    authorize @spot

    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
    else
      render :edit
    end
  end

  def destroy
    authorize @spot
    @spot.destroy
    redirect_to root_path
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def spot_params
    params.require(:spot).permit(:name, :category, :sub_category, :description, :address, :latitude, :longitude, :phone_number, :website, :photo)
  end
end
