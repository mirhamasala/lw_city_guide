class RatingsController < ApplicationController
  before_action :set_spot

  def create
    @rating = Rating.new(rating_params)
    @rating.spot = @spot
    @rating.user = current_user
    authorize @rating
    if @rating.save!
      redirect_to spot_path(@spot)
      flash[:notice] = "Succesfully added rating"
    else
      redirect_to spot_path(@spot)
      flash[:alert] = "Something went wrong, please try again"
    end
  end

  def update
    @rating = Rating.find(params[:id])
    authorize @rating
    if @rating.update(rating_params)
      redirect_to spot_path(@spot)
      flash[:notice] = "Succesfully updated rating"
    else
      redirect_to spot_path(@spot)
      flash[:alert] = "Something went wrong, please try again"
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

  def rating_params
    params.require(:rating).permit(:score)
  end
end
