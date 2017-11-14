class SpecialPricesController < ApplicationController
 def index
	@special_prices = SpecialPrice.all
end

def new
	@special_price = SpecialPrice.new
end
def create
   @special_price = SpecialPrice.new(special_price_params)
   @special_price.room_id = params[:room_id]
  if @special_price.save
    redirect_to rooms_path, notice: "successfully added special_price"
   else
     render action: "new"
  end
end	

def show
	@special_price = SpecialPrice.find(params[:id])
end

def edit
  @special_price = SpecialPrice.find(params[:id])
end
 
def update
 	@special_price = SpecialPrice.find(params[:id])
 	 if @special_price.update_attributes(special_price_params)
		redirect_to special_price_path(@special_price.id), notice: "successfully updated the special_price"
	else
		render action: "edit"
	end
end
def destroy
@special_price = SpecialPrice.find(params[:id])
@special_price.destroy
redirect_to special_prices_path, notice: "successfully destroyed the special_price"
end

private
def special_price_params
	params[:special_price].permit(:room_id, :start_date, :end_date, :price)
end  		
 	
end
