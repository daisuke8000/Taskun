class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    binding.pry
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
    reirect_to new_category_path
  end

  def search
    @category = Category.find_by('category_name LIKE(?)', "%#{params[:keyword]}%")
    render json: @category
  end

  private
  def category_params
    params.require(:categories).permit(:category_id, :category_name)
  end

end
