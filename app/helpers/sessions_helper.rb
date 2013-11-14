module SessionsHelper
	def sign_in(user)
	cookies.permanent[:remember_token] = user.remember_token
	self.current_user = user
	end
	def current_user=( user)
	@current_user = user
	end
	def current_user
	@current_user ||= Hive.find_by_remember_token(cookies[:remember_token])
	end
	def sign_in?
	!current_user.nil?
	end
	def sign_out
	self.current_user = nil
	cookies.delete(:remember_token)
	end
	def current_user?(user)
	user == current_user
	end
	def signed_in_user
	unless sign_in? 
	store_location
	redirect_to signin_path, notice: 'Please Sign in to Access this page' 
	end
	end
	def redirect_back_or(default)
	redirect_to(session[:remember_uri] || default)
	session.delete(:remember_uri)
	end
	def store_location
	session[:remember_uri] = request.fullpath
	end
end
