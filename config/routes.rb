Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'recipes/index'
      post 'recipes/create'
      get '/show/:id', to: 'recipes#show'
      delete '/destroy/:id', to: 'recipes#destroy'

      resources :trips, only: [:index]
      resources :room, only: [:index]
      resources :messages, only: [:new, :create]

      post 'authenticate', to: 'authentication#authenticate'
    
    end
  end

  #get '/*path' => 'landing#index'
  # For details on the DSL available within this file, 
  # see https://guides.rubyonrails.org/routing.html
end
