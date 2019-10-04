class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :set_city, only: [:index, :new, :create]

  def index
    @spots = policy_scope(Spot).in_city(@city)
    if params[:category].blank?
      @spots = @spots
    else
      @spots = @spots.in_category(params[:category])
    end
    @spots = @spots.recent.check_coordinates
    add_map_markers(@spots)
  end

  def new
    # spot = @city.spots.build
    spot = city.spots.build
    @not_authorized_message = "So sorry, but you can't add places for #{@city.name}. 💩"
    authorize @spot
    # render :new, locals: { spot: spot, city: city}
    # render :new, locals: { spot: spot, city: @city}
  end

  def create
    @spot = @city.spots.build(spot_params)
    @spot.user = current_user
    authorize @spot
    if @spot.save
      flash[:notice] = "Yay! You succcesfully added #{@spot.name}! 🍪"
      redirect_to spot_path(@spot)
    else
      flash.now[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :new
    end
  end

  def show
    @rating = @spot.rating_for(current_user)
  end

  def edit
  end

  def update
    if @spot.update(spot_params)
      flash[:notice] = "You updated #{@spot.name}! ⭐️"
      redirect_to spot_path(@spot)
    else
      flash.now[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :edit
    end
  end

  def destroy
    if @spot.destroy
      flash.now[:notice] = "You deleted #{@spot.name}. ✨"
      respond_to do |format|
        format.html { redirect_to city_spots_path(@spot.city) }
        format.js
      end
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
    authorize @spot
  end

  def city
    City.find(params[:city_id])
  end

  # def set_city
    # @city = City.find(params[:city_id])
  # end

  def spot_params
    params.require(:spot).permit(:name, :sub_category, :description, :address, :latitude, :longitude, :phone_number, :website, :photo, :category_id)
  end

  def add_map_markers(spots)
    @markers = spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { spot: spot }),
        image_url: helpers.asset_url("placemark_#{spot.category.name}.png")
      }
    end
  end
end
