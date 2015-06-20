class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
 		 session[:user_id] = user.id
 		 redirect_to user_path(session[:user_id]), notice: "Добро пожалоавть!"
 	  else 
 		 redirect_to login_url, notice: "Неверный логин и/или пароль"
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, notice: "Вы вышли"
  end
end
