class UsersController < ApplicationController

  def edit
  end

  def update
    current_user.update!(user_params)
   
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :assist1, :assist2, :memo)
  end
end
