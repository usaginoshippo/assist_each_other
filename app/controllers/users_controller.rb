class UsersController < ApplicationController

  def edit
  end

  def update
    current_user.update(user_params)
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :assist1, :assist2, :memo).marge(:date, :schedule)
  end
end
