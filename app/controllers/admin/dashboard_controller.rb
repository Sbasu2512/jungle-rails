class Admin::DashboardController < ApplicationController
  
    before_filter :authorize
  
    def show
    @products_count = Product.count.to_i
    @products_category = Category.count
  end

end
