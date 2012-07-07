Lunchtime::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :restaurants
  root :to => 'restaurants#index'
end
