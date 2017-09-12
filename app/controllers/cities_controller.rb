class CitiesController < ApplicationController


def index
	@cities = City.all
end


def new 
	@city = City.new
end	

def create
	@city = City.new(city_params)
	if @city.save
	redirect_to cities_path, notice: "successfully added city"
 else
 render action: "new"
 end
 end


def show
	@city = City.find(params[:id])
end
 

 private

 def city_params
 params[:city].permit(:name)
 end	

end
