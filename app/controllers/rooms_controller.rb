class RoomsController < ApplicationController
  load_and_authorize_resource

	def index
		@rooms = Room.where("is_authorized=?", true)
	end

	def new
		@room = Room.new
	end

	def create
	 @room = Room.new(room_params)
	 @room.user_id = current_user.id
	 #binding.pry
	 if @room.save
	 redirect_to rooms_path, notice: "successfully added room"
	 else
	 render action: "new"
	end
	end	

	 def show
		@room = Room.find(params[:id])
		@booking = Booking.new
		@review = Review.new
	 end

    def edit
	  @room = Room.find(params[:id])
	end
	 
	def update
	 	@room = Room.find(params[:id])
	 	 if @room.update_attributes(room_params)
 	   		Notification.room_conformation(@room).deliver!	
			redirect_to room_path(@room.id), notice: "showuccessfully updated the room"
		else
			render action: "edit"
		end
    end

   def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path, notice: "successfully destroyed the room"
    end
	def authorize
	 	@room = Room.where('is_authorized=?',false)
	 end

	 def my_rooms
	
	 @rooms = current_user.rooms
		
	 end	

	private
	def room_params
	params[:room].permit(:name, :description, :price, :rules, :address, :images,  :city_id, :latitude, :longitude, :is_authorized, amenity_ids:[])
	end	
end
	  

 