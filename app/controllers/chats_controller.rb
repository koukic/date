class ChatsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @chat = current_user.chats.build(chat_params)
    if @chat.save
      flash[:success] = 'メッセージを送信しました。'
      redirect_to root_url
    else
      @chats = current_user.feed_chats.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの送信に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @chat.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def chat_params
    params.require(:chat).permit(:content)
  end
  
  def correct_user
    @chat = current_user.chats.find_by(id: params[:id])
    unless @chat
      redirect_to root_url
    end
  end
end
