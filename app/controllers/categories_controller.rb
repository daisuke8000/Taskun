class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def create
    Category.create(category_params)
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:categories_name)
  end

end
