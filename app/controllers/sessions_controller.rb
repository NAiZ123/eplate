class SessionsController < ApplicationController
  skip_before_action :login_required
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #user = User.find_by(email: session_params[:email])

    #if user&.authenticate(session_params[:password])      
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      session[:last_access_time] = Time.current
      flash.now[:success] = 'ログインしました。'
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_path, notice: "ログアウトしました。"
  end

  private
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
