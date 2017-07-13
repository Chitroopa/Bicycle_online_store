class ReviewsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews.all
  end

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
    respond_to do |format|
      format.html { render :show}
      format.js
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.save
    redirect_to product_reviews_path
  end


end


private
  def review_params
    params.require(:review).permit(:title, :content, :product_id)
  end
