class BookingsController < ApplicationController

def index
	@bookings = current_user.bookings
end




def show
@booking = Booking.find(params[:id])
end

private
def booking_params
 params[:booking].permit(:start_date, :end_date, :user_id, :room_id, :is_confirmed)

end
end