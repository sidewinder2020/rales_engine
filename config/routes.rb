Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      namespace :merchants do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
      end

      resources :invoices, only: [:index, :show]
      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get "random", to: "random#show"
      end

      resources :customers, only: [:index, :show]
      namespace :customers do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
      end
    end
  end
end
