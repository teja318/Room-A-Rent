class CitiesController < ApplicationController
	
	load_and_authorize_resource

	def index
		@cities = City.all
		@city = City.new
	end


	def new 
		@city = City.new
	end	

	def create
		@city = City.new(city_params)
		
	  respond_to do |format|
      if @city.save
        format.html { redirect_to cities_path, notice: 'city was successfully created.' }
        #format.json { render :show, status: :created, location: @city }
        format.js
      else
        #format.html { render :new }
       # format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
      end
		# 	redirect_to cities_path, notice: "successfully added city"
		#  else 
		#  	render action: "new"
		
 	end


	def show
		@city = City.find(params[:id])
	end

	def edit
		@city = City.find(params[:id])
	end
	 
	def update
	 	@city = City.find(params[:id])
	 	if @city.update_attributes(city_params)
	redirect_to city_path(@city.id), notice: "successfully updated the city"
	else
		render action: "edit"
	end
	end

    def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path, notice: "successfully destroyed the city"
    end	

	private

	def city_params
	 params[:city].permit(:name)
	end	

end
