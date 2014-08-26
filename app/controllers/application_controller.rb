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
  
  def paginate(obj, per_page)
    @current_page = params[:page].blank? ? 1 : params[:page].to_i
    @num_of_pages = (obj.size / per_page.to_f).ceil
    
    case params[:page_to]
    when "asc"
      @current_page += 1 if @current_page < @num_of_pages
    when "desc"
      @current_page -= 1 if @current_page > 1
    end
    
    return obj.limit(per_page).offset(per_page * (@current_page - 1))
  end
end
