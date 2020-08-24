class UsersController < ApplicationController

  skip_before_action :login_required, only: [:new, :create, :show]

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # 実装は終わっていないことに注意!
    if @user.save
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

end
