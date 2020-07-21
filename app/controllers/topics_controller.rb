class TopicsController < ApplicationController
  #投稿内容
  def index
    @topics = Topic.all.includes(:favorite_users)
  end
  
  #投稿フォーム
  def new
    @topic = Topic.new
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
    redirect_to topics_path, success: '編集に成功しました'
  end
  
  #投稿削除
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path, info: '投稿を削除しました'
  end
  
  #画像,コメント投稿
  def create
    @topic = current_user.topics.new(topic_params)
    
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  #ストロングパラメータ
  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
