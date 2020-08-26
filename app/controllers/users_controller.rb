class UsersController < ApplicationController

  skip_before_action :login_required, only: [:new, :create]
  before_action :correct_user,   only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)      
    if @user.save
      log_in @user
      flash[:success] = "Welcome"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

end
