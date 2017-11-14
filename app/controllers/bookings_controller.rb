class BookingsController < ApplicationController

def index
@bookings = current_user.bookings.where("is_confirmed = ?", true)
end

def create
@booking = Booking.new(booking_params)
#binding.pry
@booking.user_id = current_user.id
#binding.pry
if @booking.save
	
	Notification.not_confirmed(@booking).deliver!
	

redirect_to bookings_path, notice: "successfully added bookings" 
# else
# 	redirect_to rooms_path
end
end


def show
@booking = Booking.find(params[:id])
end

def edit 
@booking = Booking.find(params[:id])
end

def update
@booking = Booking.find(params[:id])
 if @booking.update_attributes(booking_params)
 Notification.conformation(@booking).deliver!
redirect_to booking_path(@booking.id), notice: "successfully updated the booking"
else
render action: "edit"
end
end
def destroy
@booking = Booking.find(params[:id])
@booking.destroy
redirect_to bookings_path, notice: "successfully destroyed the booking"
end



private
def booking_params
params[:booking].permit(:start_date, :end_date, :user_id, :room_id, :price, :is_confirmed)
end

end