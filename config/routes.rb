Rails.application.routes.draw do
  get 'dashboard/show'
  root 'static_pages#top'

  resources :users, only: %i[new create]

  # ログイン関連
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # ログイン後ホーム画面
  get 'dashboard', to: 'dashboard#show'

  # ペット登録
  resources :pets, only: %i[new create]
end
