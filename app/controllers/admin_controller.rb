class AdminController < ApplicationController
  skip_action_callback :check_logined
  
  def index
    @database_user = User.exists? ? User.all.first : User.new
  end
  
  def set_database_user
    if database_user_params[:id].blank?
      @database_user = User.new(database_user_params)
      @database_user.save
    else
      @database_user = User.find(database_user_params[:id])
      @database_user.update(database_user_params)
    end
    
    redirect_to admin_index_path, notice: "Database user was successfully updated."
  end
  
  private
  def database_user_params
    params.require(:database_user).permit(:id, :username, :password)
  end
end
