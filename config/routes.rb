Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/health' => 'application#health'

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'
  
  namespace :api do
    resources :categories
  end

  resources :products do
    member do
      get 'offer_price' => 'products#offer_price'
    end

    collection do
      get 'groceries' => 'products#groceries'
    end
  end

  namespace :api do
    resources :categories
  end

  resources :orders do
    member do
      get 'get_user' => 'orders#get_user'
    end
  end
  resources :order_items
end
