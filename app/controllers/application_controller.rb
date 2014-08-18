class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :check_logined
  
  # For single service center use, set the sc_switch to false, otherwise set true.
  $sc_switch = false
  
  
  private
  def check_logined
    if session[:usr]
      begin
        @usr = User.find(session[:usr])
      rescue ActiveRecord::RecordNotFound
          reset_session
      end
    end
      
    unless @usr
      flash[:referer] = request.fullpath
      redirect_to controller: :login, action: :index
    end
  end
end
