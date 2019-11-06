Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  root 'static_pages#home'
  devise_for :users
  resources :restaurant
end
