class CategoriesController < ApplicationController
  before_action :set_spot

  def create
    @category = Category.new(category_params)
    @category.spot = @spot
  end

  private

  def set_spot
    @spot = Spot.find(params[:spot_id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
