class HomesController < ApplicationController
  
  def top
  end
  
  def about
  end
  
  def new
    @user = User.new(user_params)
  end
    
  private user_params
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
