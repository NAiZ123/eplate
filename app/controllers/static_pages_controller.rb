class StaticPagesController < ApplicationController
  skip_before_action :login_required
  
  def home
  end

  def help
  end
  
  def about
  end

  def contact
  end

end
