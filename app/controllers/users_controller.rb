class UsersController < ApplicationController
  before_action :set_beginning_of_week

  def edit
  end

  def update
    current_user.update(user_params)
  end
  
  def select
    @schedule = current_user.schedules
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :assist, :assist1, :assist2, :memo)
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

end

