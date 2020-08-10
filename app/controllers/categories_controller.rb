class CategoriesController < ApplicationController
  def new
  end

  def create
  end

  def delete
    categories = Categories.find(params[:id])
    categories.destroy
    redirect_to categories_path
  end

end
