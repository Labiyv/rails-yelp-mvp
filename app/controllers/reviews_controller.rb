class ReviewsController < ApplicationController

  def new
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new
  end

  def create
     @restaurant = Restaurant.find(params[:restaurant_id])
     @review = Review.new(review_params)
     @review.restaurant = @restaurant

     if @review.save
       redirect_to restaurant_path(@restaurant)
     else

      render :new
     end
  end

  def review_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:review).permit(:content, :rating)
  end
end
