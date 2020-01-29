class CategoriesController < ApplicationController
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key
  before_action :set_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.create(category_params)
    authorize @category
    if @category.save
      flash[:notice] = "Yay! You succesfully added the category #{@category.name}! 🍪"
      redirect_to dashboard_path
    else
      flash.now[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "You updated the category #{@category.name} succesfully! ⭐️"
      redirect_to dashboard_path
    else
      flash.now[:alert] = "Hm, it looks like something went wrong. Please, try again. 🌈"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "You deleted the category #{@category.name}. ✨"
      redirect_back(fallback_location: dashboard_path)
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

  def invalid_foreign_key
    redirect_back(fallback_location: dashboard_path, notice: "You can't delete the category #{@category.name} since it still has spots. 💩")
  end
end
