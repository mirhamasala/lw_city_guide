class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_spot, only: [:show]

  def show
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
