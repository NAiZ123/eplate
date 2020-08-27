class ApplicationController < ActionController::Base

 
  helper_method :current_user
  before_action :login_required
  before_action :check_timeout

  protect_from_forgery with: :exception
  include SessionsHelper


  private  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  private def login_required
    
    unless current_user
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_path
    end 
  end 


  TIMEOUT = 60.minutes

  private def check_timeout
    if current_user
      if session[:last_access_time] > TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        forget(current_user)
        session.delete(:user_id)
        flash.alert = "セッションがタイムアウトしました。"
        redirect_to root_path
      end
    end
  end

end
