class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /orders
  # GET /orders.json

  def order_pdf
    @orders = current_user.orders
     respond_to do |format|
      format.html
      format.pdf do
        render pdf: "order_pdf"   # Excluding ".pdf" extension.
      end
    end  
  end

  def index
    @orders = Order.all

    # @orders = current_user.orders  
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    # @product = @order.product
    @cart_item = CartItem.find(params[:cart_item])
    @product = Product.unscoped.find(@cart_item.product_id)
    @reviews = @product.reviews.to_a
    @avg_rating = if @reviews.blank?
      0
    else
      @product.reviews.average(:rating).present? ? @product.reviews.average(:rating).round(2) : 0
    end

    if current_user.reviews.where(product_id: @product.id).any?
      @review = current_user.reviews.where(product_id: @product.id).first
    else
      @review = Review.new
    end
  end

  # GET /orders/new
  def new
    # @cart = Cart.find(params[:cart_id])
    # @product = Product.find(params[:product_id])
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end
  def order_product
    @orders = Order.all
    
  end

  # POST /orders
  # POST /orders.json
  def create
    # @product = Product.find(params[:order][:product_id])
    # @cart = Cart.find(params[:order][:cart_id])
    customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: current_cart.sub_total.to_i,
        description: 'Rails Stripe customer',
        currency: 'usd',
        
      })

    address = Address.find(params[:order][:address_id])  
    @order = Order.new(order_params)
    @order.country = address.country
    @order.postal_code = address.post_code
    @order.address = address.address
    @order.town = @order.district = address.district
    @order.customer = customer.id
    @order.description = 'Rails Stripe customer'
    @order.cart_id = current_cart.id
    @order.price = charge.amount
    respond_to do |format|
      if @order.save
        current_cart.update(is_done: true)
        UserMailer.order_product(current_user).deliver_later
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :cart_id, :product_id, :price, :status, :quantity, :first_name, :last_name, :email, :phone, :country, :address, :town, :postal_code, :is_active, :address_id  )
    end
end
