class UsersController < ApplicationController
  def show
    @user = current_user
    @book = Book.new
    @books = @user.books.all
  end

  def index
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have update user successfully."
    else
      render "edit"
    end
  end

  def destroy
    user = User.find(params.id)
    user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
