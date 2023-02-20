Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  devise_for :users

  namespace :admin do
    resources :customers
  end

  namespace :admin do
    resources :orders
  end
end