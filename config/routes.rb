Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/health' => 'application#health'

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

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
end
