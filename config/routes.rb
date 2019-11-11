Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  root 'static_pages#home'

  devise_for :users, :controllers => { :registrations => :registrations }
  resources :restaurant
  resources :comments
  get '/admins' => "admins#home", :as => :admin_root
end
