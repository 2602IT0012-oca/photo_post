class SessionsController < ApplicationController
  def new
    # 初期画面（ログイン画面）
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path # マイページへ遷移
    else
      flash.now[:alert] = "名前またはパスワードが正しくありません"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "ログアウトしました"
  end
end
