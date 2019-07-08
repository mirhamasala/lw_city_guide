class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :home]
  before_action :set_city, only: [:show]

  def home
    @city = City.find_by_name("Barcelona")
    render "cities/show"
  end

  def show
  end

  private

  def set_city
    @city = City.find(params[:id])
  end
end
