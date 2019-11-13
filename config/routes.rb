Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  root 'static_pages#home'

  devise_for :users, :controllers => { :registrations => :registrations }
  resources :restaurant
  resources :comments
  get '/admins' => "admins#home", :as => :admin_root
  get '/staticpages/about', to: "static_pages#about", as: :about
  get '/staticpages/contact', to: "static_pages#contact", as: :contact
end
