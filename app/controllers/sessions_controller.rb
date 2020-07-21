class SessionsController < ApplicationController
  #newビュー
  def new
  end
  
  #ログイン
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to calendars_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  #ログアウト
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  #ログイン
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #ログアウト
  def log_out
    session.delete(:user_id)
    @current_user =nil
  end
  
  #ストロングパラメータ
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
