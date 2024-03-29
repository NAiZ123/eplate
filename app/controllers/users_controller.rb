class UsersController < ApplicationController

  skip_before_action :login_required, only: [:new, :create]
  before_action :correct_user,   only: [:edit, :update, :destroy] 

  def index
    @users = User.page(params[:page])
    #ソート機能追加予定
    #ユーザー一覧ではなく記事一覧に変更予定
  end


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
  
  def edit
    @user = User.find(params[:id])
  end
 
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
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
