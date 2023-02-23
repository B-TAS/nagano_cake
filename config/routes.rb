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
    root to: 'homes#top'
    #get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders
    #destroyは後で削除
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
   # 会員側のルーティング設定
  scope module: :public do
    root to: 'homes#top'
    get "about" => "homes#about"
    # unsubscribeをupdateの上に記述する必要がある.updateが/update.idとなるため,unsubscribより上に記述してしますとidがunsubscribに反応してしますためエラーが生じる.
    # idは数字以外も取得してします.unsubscribもidとして認識されてしまう.
    patch '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    resources :customers, only: [:update]
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/my_page/edit' => 'customers#edit', as: 'my_page_edit'
    get '/customers/confirm' => 'customers#confirm'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :destroy, :update, :create]
    delete "cart_items/destroy_all" => 'cart_items#destroy_all', as: "destroy_all"
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get "orders/complete" => 'orders#complete', as: "complete"
    resources :orders, only: [:new, :index, :show, :create]
  end
end