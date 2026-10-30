class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update]

  # サインアップ画面
  def new
    @user = User.new
  end

  # サインアップ処理
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # 登録と同時にログイン
      redirect_to user_path, notice: "会員登録が完了しました"
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end
end
