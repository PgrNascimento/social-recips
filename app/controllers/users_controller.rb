class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update]

	def new
		@user = User.new
	end

	def show
		@user = User.find params[:id]
	end

	def edit
		@user = current_user
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

	def update
		if logged_in?
			@user = current_user
			if @user.update user_params
				redirect_to @user
			else
				flash[:error] = "Não foi possível atualizar cadastro"
				render :edit
			end
		else
			redirect_to root_path
		end
	end


	def logged_in_user
		unless logged_in?
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :city, :mail, :facebook, :twitter, :password)
	end
end
