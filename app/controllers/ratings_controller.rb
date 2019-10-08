class RatingsController < ApplicationController
  before_action :set_rating, only: :update
  before_action :set_spot, only: [:create, :update]

  def create
    @rating = @spot.ratings.build(rating_params)
    @rating.user = current_user
    authorize @rating
    if @rating.save!
      redirect_to spot_path(@spot)
      flash[:notice] = "Yay! You succesfully rated #{@spot.name}! 🔥"
    else
      redirect_to spot_path(@spot)
      flash[:alert] = "Oops! Something went wrong, please try again. 🌈"
    end
  end

  def update
    if @rating.update(rating_params)
      redirect_to spot_path(@spot)
      flash[:notice] = "Boom! You succesfully updated your rating for #{@spot.name}! 💥"
    else
      redirect_to spot_path(@spot)
      flash[:alert] = "Oops! Something went wrong, please try again. 🌈"
    end
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
    authorize @rating
  end

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

  def rating_params
    params.require(:rating).permit(:score)
  end
end
