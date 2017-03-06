class SessionsController < ApplicationController
	def new
	end

	def create
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user && user.password == params[:session][:password]
      log_in user
      redirect_to user
    else
      flash.now[:error] = 'E-mail/senha inválido(s)'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end