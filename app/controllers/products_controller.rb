class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
         format.html { redirect_to define_admin_routes({resourceName: 'Product', objectId: @product.id}), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
         format.html { redirect_to define_admin_routes({resourceName: 'Product', objectId: @product.id}), notice: 'Product was successfully updated.' }
         format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to define_admin_routes({resourceName: 'Product'}), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_wishlist
    @product = Product.find(params[:product_id])
    if user_signed_in?
      existing_wishlist = current_user.wishlists.where(product_id: @product.id)
      if existing_wishlist.present?
        redirect_back fallback_location: root_path, notice: "Product is already in your wishlist"
      else
        current_user.wishlists.create(product_id: @product.id)
        redirect_to root_path, notice: "Product has been added in to your wishlist"
      end
    else
      redirect_to "/users/sign_in", notice: "you need to sign in or sign up"
    end
  end

  def remove_wishlist
    @product = Product.find(params[:product_id])
    current_user.wishlists.where(product_id: @product.id).first.destroy
    redirect_to "/wishlist"
  end

  def wishlist
    product_ids = current_user.wishlists.map(&:product_id)
    @products = Product.where(id: product_ids)
  end
  def add_cart
    @product = Product.find(params[:product_id])
    if user_signed_in?
      existing_cart = current_user.carts.where(product_id: @product.id)
      if existing_cart.present?
        redirect_back fallback_location: root_path, notice: "Cart is already in your cart"
      else
        current_user.carts.create(product_id: @product.id)
        redirect_to carts_path, notice: "Cart has been added in to your cart"
      end
    else
      redirect_to "/users/sign_in", notice: "you need to sign in or sign up"
    end
  end

  def remove_cart
    @product = Product.find(params[:product_id])
    current_user.carts.where(product_id: @product.id).first.destroy
    redirect_to "/carts"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :image, :price, :size, :is_active, :status, :description, :category_id, :discount_price)
    end
end
