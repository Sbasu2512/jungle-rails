class Admin::SalesController < ApplicationController

  before_filter :authorize

  def index
     @sales = Sale.all
  end 
end