class MicropostsController < ApplicationController
	before_filter :signed_in_user
	def create
	@micropost = current_user.microposts.build(params[:micropost])
	if @micropost.save
	 flash[:notice] = "micropost posted!"
	 redirect_to root_path
	 else
	redirect_to root_path
	 end
	end
	def destroy
	end

end