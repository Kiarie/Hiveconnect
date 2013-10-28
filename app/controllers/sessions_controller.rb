class SessionsController < ApplicationController
def new
end
def create
	hive_user =  Hive.find_by_email(params[:session][:email])
	if hive_user && hive_user.authenticate(params[:session][:password])
	sign_in hive_user
	redirect_to hive_user
	else
	flash.now[:error] = "invalid password or email"
	render 'new'
	end
end
def destroy
	sign_out
	redirect_to root_path
end

end
