class SpotStatusesController < ApplicationController
  def update
    @spot = Spot.find(params[:id])
    authorize @spot, :update_status?
    if @spot.draft?
      @spot.published!
      flash[:notice] = "#{@spot.name} is now live! 🚀"
    elsif @spot.published?
      @spot.draft!
      flash[:notice] = "You unpublished #{@spot.name}! 👻"
    end
    redirect_to spot_path(@spot)
  end
end
