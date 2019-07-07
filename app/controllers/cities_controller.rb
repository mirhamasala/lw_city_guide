class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_city, only: [:show]

  def show
  end

  private

  def set_city
    @city = City.find(params[:id])
  end
end
