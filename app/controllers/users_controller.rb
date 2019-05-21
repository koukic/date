class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :destroy]
  def index
    @users  = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @lover = @user.followings.first
    @chats = @user.chats.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
 
  #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
 
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :edit
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end   
   
    else
      redirect_to root_url
    end
  
  end

  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'アカウントは正常に削除されました'
    redirect_to users_url
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end
  
   
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :remember_digest)
  end
end
class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :destroy]
  def index
    @users  = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @lover = @user.followings.first
    @chats = @user.chats.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
 
  #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
 
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :edit
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end   
   
    else
      redirect_to root_url
    end
  
  end

  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
      else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'アカウントは正常に削除されました'
    redirect_to users_url
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end
  
   
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache, :remove_image)
  end
end
