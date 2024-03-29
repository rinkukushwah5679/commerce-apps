class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create

    @product = Product.unscoped.find(params[:review][:product_id])
    # @review = Review.where(product_id: @product, user_id: current_user.id)
    if params[:review][:review_id].present?
      review = Review.find(params[:review][:review_id])
      review.update(review_params)
    else
      @review = Review.new(review_params)
      @review.save
    end
    redirect_back fallback_location: root_path, notice: 'Review was successfully created.'
    # @review = Review.new(review_params)

    # respond_to do |format|
    #   if @review.save
    #     format.html { redirect_back fallback_location: @order, notice: 'Review was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @review.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment, :user_id, :product_id, :image, :order_id)
    end
end
