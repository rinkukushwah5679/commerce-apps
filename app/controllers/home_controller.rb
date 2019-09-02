class HomeController < ApplicationController
  def index
   @products = Product.all
  end
  def category_details
   @category = Category.find(params[:id])
  end
  def product_details
  	@product = Product.find(params[:id])
  end
end
