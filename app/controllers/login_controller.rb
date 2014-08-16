class LoginController < ApplicationController
  skip_action_callback :check_logined
  
  def index
  end
  
  def auth
    usr = User.authenticate(params[:username], params[:password])
    
    if usr
      reset_session
      session[:usr] = usr.id
      redirect_to params[:referer]
    else
      flash.now[:referer] = params[:referer]
      @error = "ユーザー名/パスワードが間違っています"
      render 'index'
    end
  end
  
  def logout
    reset_session
    redirect_to sales_forecasts_path
  end
end
