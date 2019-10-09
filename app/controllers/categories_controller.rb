class CategoriesController < ApplicationController
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

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
