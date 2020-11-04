class UsersController < ApplicationController
  before_action :admin_user, only: [:new]
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_user_path, success: '上書きに成功しました'
  end

  #ユーザー登録
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to calendars_path, success: '登録に成功しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :description, :birthday, :password, :password_confirmation)
  end
  
  #管理者権限
  def admin_user
    redirect_to calendars_path unless current_user.admin?
  end
end
