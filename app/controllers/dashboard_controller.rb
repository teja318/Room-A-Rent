class DashboardController < ApplicationController
# def home
# @bookings = Booking.all
# end

def bookings
	@bookings = Booking.all
end
end