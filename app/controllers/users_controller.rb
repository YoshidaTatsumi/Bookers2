class UsersController < ApplicationController
  def top
  end
  def about
  end
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
  	 redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def follows
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end


  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction, :postal_code, :address_city, :address_street, :prefecture_code, :latitude, :longitude)
  end
end
