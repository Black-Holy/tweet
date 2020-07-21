class CommentsController < ApplicationController
  #コメントフォーム
  def new
    @comment = Comment.new
  end
  
  #コメント投稿
  def create
    @comment = Comment.new(params_comment)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topics_path, success: 'コメントに成功しました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to topics_path, info: 'コメントを削除しました'
  end
  
  #ストロングパラメータ
  private
  def params_comment
    params.require(:comment).permit(:reply, :topic_id)
  end
end
