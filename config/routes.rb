Rails.application.routes.draw do
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    #get 'homes/top' => 'homes#top', as: 'homes'
    get 'top' => 'homes#top', as: 'top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end
   # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    resources :customers, only: [:show, :edit, :update]
    get 'customers/my_page' => 'customers#show', as: 'my_page'
  end

end
