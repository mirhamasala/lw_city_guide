class CountriesController < ApplicationController
  before_action :set_country, only: [:edit, :update, :destroy]

  def new
    @country = Country.new
    authorize @country
  end

  def create
    @country = Country.new(country_params)
    authorize @country
    if @country.save
      flash[:notice] = "Yay! You successfully created #{@country.name}! 🍪"
      redirect_to root_path
    else
      flash[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :new
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      flash[:notice] = "You updated #{@country.name}! ⭐️"
      redirect_to dashboard_path
    else
      flash.now[:alert] = "Oops! Something went wrong. Please, try again. 🌈"
      render :edit
    end
  end

  def destroy
    if @country.destroy
      flash.now[:notice] = "You deleted #{@country.name}. ✨"
      redirect_back(fallback_location: dashboard_path)
    end
  end

  private

  def set_country
    @country = Country.find(params[:id])
    authorize @country
  end

  def country_params
    params.require(:country).permit(:name)
  end
end
