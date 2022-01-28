class UsersController < ApplicationController

  def edit
  end

  def update
    current_user.update(user_params)
  end

  def show
    @schedule = current_user.schedules
  end
  
  def select
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :assist1, :assist2, :memo)
  end

end

