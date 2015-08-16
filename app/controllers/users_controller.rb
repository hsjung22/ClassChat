class UsersController < ApplicationController

	def index
	end

	def create
		user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
		if user.errors.any?
			flash[:errors]= user.errors.full_messages
			redirect_to "/"
		else
			session[:user_id] = user.id
			redirect_to "/classes"
		end
	end

end