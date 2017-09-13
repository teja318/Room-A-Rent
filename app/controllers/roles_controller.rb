class RolesController < ApplicationController
load_and_authorize_resource

def index
	@roles = Role.all
end

def new
	@role = Role.new
end
def create
 @role = Role.new(role_params)
 if @role.save
 redirect_to roles_path, notice: "successfully added role"
 else
 render action: "new"
end
end	

def show
	@role = Role.find(params[:id])
end
private
def role_params
params[:role].permit(:name)
end	

end
