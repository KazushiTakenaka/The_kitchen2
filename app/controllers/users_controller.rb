class UsersController < ApplicationController

  def list
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
         flash[:notice] =
         redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :image, :introduction )
  end

end
