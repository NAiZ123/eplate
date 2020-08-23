class UsersController < ApplicationController

  skip_before_action :login_required

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
end
