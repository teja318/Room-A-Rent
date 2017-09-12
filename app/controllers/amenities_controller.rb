class AmenitiesController < ApplicationController

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
private
def amenity_params
	params[:amenity].permit(:name, :description)
end
end
