class ToppagesController < ApplicationController
  def index
    if logged_in?
      @chat = current_user.chats.build  # form_with 用
      @chats = current_user.feed_chats.order(id: :desc).page(params[:page])
    end
  end
end
