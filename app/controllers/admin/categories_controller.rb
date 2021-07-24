class Admin::CategoriesController < ApplicationController
  before_filter :authorize

  def index
    @categories = Category.all
    puts 'categories from active record: '
    p @categories
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Categry created!'
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end

end