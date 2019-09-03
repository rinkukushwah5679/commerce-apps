class HomeController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 8)
   end

  def category_details
   @category = Category.find(params[:id])
   @products = @category.products.paginate(page: params[:page], per_page: 8) 
  end

  def product_details
  	@product = Product.find(params[:id])
  end
end
