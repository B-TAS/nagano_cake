Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    #destroyは後で削除
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
end
