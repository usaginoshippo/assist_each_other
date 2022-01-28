class SchedulesController < ApplicationController
  before_action :set_beginning_of_week

  def index
    @schedule = Schedule.new
    @group = Group.find(params[:group_id])
    @schedules = @group.schedules.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @group = Group.find(params[:group_id])
    @schedule = @group.schedules.new(schedule_params)
    if@schedule.save
      redirect_to group_schedules_path(@group)
    else
      render :index
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to root_path, notice:"削除しました"
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to group_schedules_path, notice: "編集しました"
    else
      render 'edit'
    end
  end


  private
  def schedule_params
    params.require(:schedule).permit(:content, :start_time).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
