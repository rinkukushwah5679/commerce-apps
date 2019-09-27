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
    if params[:start_date].present? && params[:end_date].present?
      @orders = Order.where('created_at BETWEEN ? AND ?', params[:start_date].to_date.beginning_of_day, params[:end_date].to_date.end_of_day)

    else
     @orders = Order.all
    end
     @products = Product.all
  end
end
