Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/health' => 'application#health'

  resources :users do
    resources :orders do
      member do
        get 'get_user' => 'orders#get_user'
      end
      resources :order_items
    end
    member do
      post :upload_picture
    end
  end

  resources :products do
    member do
      get 'offer_price' => 'products#offer_price'
      post :upload_picture
    end

    collection do
      get 'available' => 'products#available'
      get 'groceries' => 'products#groceries'
    end
  end

  namespace :api do
    resources :categories
  end

end
