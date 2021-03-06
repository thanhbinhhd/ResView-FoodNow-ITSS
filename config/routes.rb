Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  root 'static_pages#home'

  devise_for :users, :controllers => { :registrations => :registrations, :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :restaurant
  resources :comments
  get '/admins' => "admins#dashboards", :as => :admin_root
  get '/staticpages/about', to: "static_pages#about", as: :about
  get '/staticpages/contact', to: "static_pages#contact", as: :contact

  scope '/admins' do
    get 'restaurants', to: "admins#restaurants", as: :admin_restaurant_list
    get '/users', to: "admins#users", as: :admin_user_list
    get '/transactions', to: "admins#transactions", as: :admin_transaction_list
    get '/foods', to: "admins#foods", as: :admin_food_list
    resources :transactions, only: [:new, :create]
    resources :foods
  end

end
