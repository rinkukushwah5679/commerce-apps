class HomeController < ApplicationController

  def index
    # flash[:alert] = "You are not authorized to perform this action."

    if params[:search].present?
     @products = Product.where("lower(title) LIKE :prefix OR lower(description) LIKE :prefix", prefix: "%#{params[:search].downcase}%").paginate(page: params[:page], per_page: 8)
    else
      @categories = Category.all
      @products = Product.paginate(page: params[:page], per_page: 8)
    end
  end

  def category_details
    @category = Category.find(params[:id])
    @products = @category.products.paginate(page: params[:page], per_page: 8) 
  end

  def product_details
    @product = Product.find(params[:id])
    @reviews = @product.reviews.to_a
    @avg_rating = if @reviews.blank?
      0
    else
      @product.reviews.average(:rating).round(2)
    end
  end
  
   
  def bsupplier
  end

  def brequirement
  end

  def sadvertise
  end

  def spost
  end

  def cbuy
  end

  def csection
  end

  def about
  end

  def contact
  end

end