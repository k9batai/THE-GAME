Rails.application.routes.draw do
  
# 顧客用
# URL /end_users/sign_in ...
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

# 会員側のルーティング設定
  scope module: :public do
  root to: "homes#top"
  get '/about' => 'homes#about', as: 'about'

  get '/mypage' => 'end_users#index'
  get '/mypage/edit' => 'end_users#edit'
  patch '/mypage' => 'end_users#update'

  resources :posts

  resources :post_comments, except: [:index]

  end
end
