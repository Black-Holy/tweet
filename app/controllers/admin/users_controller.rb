class Admin::UsersController < ApplicationController
  before_action :admin_user
  #登録ユーザー一覧
  def index
    @users = User.all.order(id: "ASC")
  end
  
  #ユーザー削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, info: 'ユーザーを削除しました'
  end
  
  private
  def admin_user
    redirect_to calendars_path unless current_user.admin?
  end
end
