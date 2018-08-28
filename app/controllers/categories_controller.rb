class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy, :edit, :update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      flash[:success] = "You created #{category.title}"
      redirect_to categories_path
    else
      flash.notice = "Category already exists!"
      redirect_to new_category_path
    end
  end

  def show
    @jobs = @category.jobs
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
