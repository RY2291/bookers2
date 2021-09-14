class UsersController < ApplicationController
  def show
    @user = current_user
    @book = Book.new
  end
  
  
  
end
