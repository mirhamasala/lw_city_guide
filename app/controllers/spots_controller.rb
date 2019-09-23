class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :set_city, only: [:index, :new, :create]

  def index
    @spots = policy_scope(Spot).where(city: @city)
    if params[:category].blank?
      @spots = @spots.recent
    else
      @category_id = Category.find_by(name: params[:category]).id
      @spots = @spots.where(category_id: @category_id).recent
    end
    @spots = @spots.check_coordinates
    add_map_markers(@spots)
  end

  def new
    @spot = Spot.new
    unless current_user.cities.include?(@city)
      flash[:alert] = "So sorry, but you can't add places for #{@city.name}. 💩"
      redirect_back(fallback_location: root_path)
    end
    authorize @spot
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    @spot.city = @city
    if @spot.save
      flash[:notice] = "Yay! You succcesfully added #{@spot.name}! 🍪"
      redirect_to spot_path(@spot)
    else
      flash.now[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :new
    end
    authorize @spot
  end

  def show
    @rating = Rating.where(user: current_user, spot: @spot).first || Rating.new
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

  def set_city
    @city = City.find(params[:city_id])
  end

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
