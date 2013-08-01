class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_current_user
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end
	
end
