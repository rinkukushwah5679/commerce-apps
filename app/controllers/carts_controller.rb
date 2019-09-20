class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /carts
  # GET /carts.json
  def index
    # @carts = Cart.all 
    # product_ids = current_cart.cart_items.map(&:product_id)
    # @products = Product.where(id: product_ids)
    #  if user_signed_in?
    #   @carts = current_cart.cart_items 
    #  else
    #   redirect_to "/users/sign_in", notice: "you need to sign in or sign up"
    #  end
    current_cart.cart_items.each do |cart_item|
      if cart_item.product.nil?
        cart_item.destroy!
      end
    end 
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def update_cart_item_quantity
    cart_item = CartItem.find(params[:cart_item_id])
    if params[:type] == "increase"
      cart_item.update(quantity: cart_item.quantity + 1)
      cart_item.price = cart_item.quantity * cart_item.unit_price
      cart_item.save
    elsif params[:type] == "decrease" && cart_item.quantity != 1
      cart_item.update(quantity: cart_item.quantity - 1)
      cart_item.price = cart_item.quantity * cart_item.unit_price
      cart_item.save
    end
  end

  
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :product_id)
    end
end