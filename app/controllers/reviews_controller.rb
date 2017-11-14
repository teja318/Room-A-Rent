class ReviewsController < ApplicationController


def index
	@reviews = Review.all
end

def new
	@review = Review.new
end

def create
 @review = Review.new(review_params)
 @review.user_id = current_user.id
 if @review.save
redirect_to reviews_path, notice: "successfully added review"
 else
 render action: "new"
end
end

def edit
@review = Review.find(params[:id])
end
	 
def update
@review = Review.find(params[:id])
if @review.update_attributes(review_params)
redirect_to review_path(@review.id), notice: "successfully updated the review"
else
render action: "edit"
end
end
def show
@review = Review.find(params[:id])

end	
def destroy
@review = Review.find(params[:id])
@review.destroy
redirect_to reviews_path, notice: "successfully destroyed the review"
end

private
def review_params
 params[:review].permit(:review, :food_rating, :cleanliness_rating, :safety_rating, :facility_rating, :locality_rating, :room_id, :user_id)
end
end
