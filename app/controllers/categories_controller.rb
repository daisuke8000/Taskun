class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
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
    redirect_to new_category_path
  end

  def search
    @categories = Category.where("category_name LIKE ?", "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json {
        render json: @categories
      }
    end
  end

  private
  def category_params
    params.require(:category).permit(:category_id, :category_name)
  end

end
