Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
        get "/:id/customers_with_pending_invoices", to: "customers_with_pending_invoices#index"
        get "/:id/favorite_customer", to: "favorite_customer#show"
        get "/most_revenue", to: "most_revenue_quantity#index"
        get "/revenue", to: "revenue_by_date#index"

      end
      resources :merchants, only: [:index, :show]

      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get "random", to: "random#show"
      end
      resources :invoices, only: [:index, :show]

      namespace :customers do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
      end
      resources :customers, only: [:index, :show]

      namespace :transactions do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
      end
      resources :transactions, only: [:index, :show]

      namespace :items do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
        get "items/most_revenue", to: "most_revenue#index"
      end
      resources :items, only: [:index, :show]

      namespace :invoice_items do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
      end
      resources :invoice_items, only: [:index, :show]
    end
  end
end
