Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  
  get    '/carts',  to: 'carts#index'
  get    '/payment',  to: 'carts#payment'

  get    'signup',  to: 'users#new'

  namespace :admin do
    root "dashboard#index", page: "index"
    # get "home", to: "dashboard#index"
    resources :users
    resources :food_categories
    resources :foods
  end

  devise_for :users
  root "foods#index"
  resources :users
  resources :foods
  resources :carts
  # get "/static_pages/:page", to: "static_pages#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
