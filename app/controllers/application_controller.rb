class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # For single service center use, set the sc_switch to false, otherwise set true.
  $sc_switch = true
end
