class Admin::DashboardController < ApplicationController
  def show
    @products_count = Product.count.to_i
    @products_category = Category.count
  end

end
