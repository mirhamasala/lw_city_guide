class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update]

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.create(category_params)
    authorize @category
    if @category.save
      flash[:notice] = "Yay! You succesfully added the category #{@category.name}! 🍪"
      redirect_to root_path
    else
      flash[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "You updated the category #{@category.name} succesfully! ⭐️"
      redirect_to dashboard_path
    else
      flash[:alert] = "Oops! Something went wrong. Please, try again. 🌈"
      render :edit
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
    authorize @category
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
