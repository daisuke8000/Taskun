class CategoriesController < ApplicationController
  def index
    @categories = Categories.all
  end

  def create
    Category.create(categories_params)
    redirect_to categories_path
  end

  def destroy
    @categories = Categories.find(params[:id])
    @categories.destroy
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

end
