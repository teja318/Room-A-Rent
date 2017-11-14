class AmenitiesController < ApplicationController
 load_and_authorize_resource
def index
 @amenities = Amenity.all
end

def new
 @amenity = Amenity.new
end

def create
@amenity = Amenity.new(amenity_params)
if @amenity.save
redirect_to amenities_path, notice: "successfully added amenity"
else
render action: "new"	
end
end

def show 
 @amenity = Amenity.find(params[:id])
end 
    def edit
		@amenity = Amenity.find(params[:id])
	end
	 
	def update
	 	@amenity = Amenity.find(params[:id])
	 	if @amenity.update_attributes(amenity_params)
	redirect_to amenity_path(@amenity.id), notice: "successfully updated the amenity"
	else
		render action: "edit"
	end
	end

    def destroy
    @amenity = Amenity.find(params[:id])
    @amenity.destroy
    redirect_to cities_path, notice: "successfully destroyed the amenity"
    end	


private
def amenity_params
	params[:amenity].permit(:name, :description)
end
end
