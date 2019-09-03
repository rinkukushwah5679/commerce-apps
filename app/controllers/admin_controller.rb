class AdminController < ApplicationController
  layout 'admin'
  before_action :authentication_admin!
 
  def index
   if params[:search].present?
      @products = Product.where("lower(title) LIKE :prefix OR lower(description) LIKE :prefix",prefix: "%#{params[:search].downcase}%")
    elsif params[:category_id].present?
      @cat = Category.find(params[:category_id])
      @products = @cat.products
    else
      @products = Product.all
    end
  	@categories = Category.all	
  end
end
