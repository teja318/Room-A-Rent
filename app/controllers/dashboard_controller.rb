class DashboardController < ApplicationController
# def home
# @bookings = Booking.all
# end

def bookings
	@bookings = Booking.all
end

def user

 @users = User.all
 @users = User.where('id != ?', current_user.id)
 #@role =  Role.find(@user.role_id) 
 #@users = User.where('role_id = ?', @role.id)
end
end