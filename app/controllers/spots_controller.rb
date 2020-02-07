class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :set_city, only: [:index]
  before_action :set_categories, only: [:index]

  def index
    @spots = policy_scope(Spot).in_city(@city)
    if params[:categories].blank?
      @spots = @spots
    else
      @spots = @spots.in_category(params[:categories].split(","))
    end
    @spots = @spots.published.recent.check_coordinates
    # @pagy, @spots = pagy(@spots, items: 5)
    add_map_markers(@spots)

    if request.xhr?
      render partial: "spots_results"
    else
      render :index
    end
  end

  def new
    @spot = Spot.new
    authorize @spot
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.owner = current_user
    authorize @spot
    if @spot.save
      if current_user.admin? || current_user.city_keeper?
        flash[:notice] = "Yay! You succesfully submitted #{@spot.name}! Please review it now and hit 'publish' when ready. 🍪"
        redirect_to spot_path(@spot)
      else
        flash[:notice] = "Sprinkels! Thank you for sharing #{@spot.name}! We'll review it and publish shortly. 🍪"
        redirect_to dashboard_path
      end
    else
      flash.now[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :new
    end
  end

  def show
    @rating = @spot.rating_for(current_user)
    add_map_marker(@spot)
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
      flash[:notice] = "You deleted #{@spot.name}. ✨"
      redirect_back(fallback_location: dashboard_path)
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

  def set_categories
    @categories = Category.alphabetize
  end

  def spot_params
    params.require(:spot).permit(:name, :sub_category, :description, :address, :latitude, :longitude, :phone_number, :website, :photo, :category_id, :status, :city_id)
  end

  # Add multiple markers
  def add_map_markers(spots)
    @markers = spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "shared/infowindow", locals: { spot: spot }),
        image_url: helpers.asset_url("placemark_#{spot.category.name}.png")
      }
    end
  end

  # Add one marker
  def add_map_marker(spot)
    @markers = [
      {
        lat: @spot.latitude,
        lng: @spot.longitude,
        image_url: helpers.asset_url("placemark_#{@spot.category.name}.png")
      }
    ]
  end
end
