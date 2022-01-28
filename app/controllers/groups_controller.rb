class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  def index
    @groups = Group.all
    @group_joining = GroupUser.where(user_id: current_user.id)
    @group_lists_none = "グループに参加していません。"
  end
    
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
       @group.users << current_user
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
  end
  
  def update

    if @group.update(group_params)
      @group.users << current_user
      redirect_to  groups_path, method: :patch, notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, notice: "グループを削除しました。"
  end

  private

  def group_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
