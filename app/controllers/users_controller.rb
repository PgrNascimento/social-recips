class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		@user = User.find params[:id]
	end

	def create
		@user = User.new user_params
		if params[:user][:password] == params[:user][:confirm_password] 
			if @user.save
				log_in @user
				redirect_to @user
			else
				flash[:error] = "Não foi possível efetuar cadastro"
				render :new
			end
		else
			flash[:error] = "As senhas não coincidem"
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :city, :mail, :facebook, :twitter, :password)
	end
end