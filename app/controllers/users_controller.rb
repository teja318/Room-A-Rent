class UsersController < ApplicationController

 def index
 	@users = User.all
 end
 def new
  @user = User.new	
 end
 def create
 @user = User.new(user_params)
 if @user.save
 redirect_to users_path, notice: "successfully added user"
 else
 render action: "new"
 end
 end

 def show 
 	@user = User.new(user_params)
 end
 private

 def user_params
 	params[:user].permit(:email, :password,:first_name, :last_name, :username, :mobile,  role_ids:[])
 end	

end
