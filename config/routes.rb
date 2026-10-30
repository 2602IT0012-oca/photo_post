Rails.application.routes.draw do
  root 'sessions#new'

  # ログイン・ログアウト
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # サインアップ
  get    '/signup', to: 'users#new'
  post   '/signup', to: 'users#create'

  # ユーザー（マイページ、編集）
  resource :user, only: [:show, :edit, :update]

  # 投稿
  resources :posts, only: [:index, :new, :create, :show]
end


