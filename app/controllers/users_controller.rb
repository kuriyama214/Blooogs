class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    current_user.update(update_params)
    redirect_to controller: :users, action: :show
  end
  
  private
  def update_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
