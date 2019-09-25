class AdminController < ApplicationController
  layout 'admin'
  before_action :authentication_admin!
 
  def index
   if params[:search].present?
      @products = Product.where("lower(title) LIKE :prefix OR lower(description) LIKE :prefix",prefix: "%#{params[:search].downcase}%").paginate(page: params[:page], per_page: 4)
    elsif params[:category_id].present?
      @cat = Category.find(params[:category_id])
      @products = @cat.products.paginate(page: params[:page], per_page: 4)
    else
      @products = Product.paginate(page: params[:page], per_page: 4)
    end
  	@categories = Category.all	
  end
  def display_report
    @orders = Order.all
    @products = Product.all
    
  end
end
