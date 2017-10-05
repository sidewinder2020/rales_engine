Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
        get "/:id/revenue", to: "revenue#show"
        get "most_items", to: "most_items#index"
        get "/:id/items", to: "items#index"
        get "/:id/invoices", to: "invoices#index"
      end
      resources :merchants, only: [:index, :show]

      namespace :invoices do
        get 'find', to: 'search#show'
        get 'find_all', to: 'search#index'
        get "random", to: "random#show"
        get "/:id/customer", to: "customer#show"
        get "/:id/merchant", to: "merchant#show"
        get "/:id/transactions", to: "transactions#index"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/items", to: "items#index"
      end
      resources :invoices, only: [:index, :show]

      namespace :customers do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
        get "/:id/favorite_merchant", to: "favorite_merchant#show"
        get "/:id/invoices", to: "invoices#index"
      end
      resources :customers, only: [:index, :show]

      namespace :transactions do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
        get "/:id/invoice", to: "invoice#show"
      end
      resources :transactions, only: [:index, :show]

      namespace :items do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
        get "/:id/best_day", to: "best_day#show"
        get "most_items", to: "most_items#index"
        get "/:id/merchant", to: "merchant#show"
        get "/:id/invoice_items", to: "invoice_items#index"

      end
      resources :items, only: [:index, :show]

      namespace :invoice_items do
        get "find", to: "search#show"
        get "find_all", to: "search#index"
        get "random", to: "random#show"
        get "/:id/item", to: "item#show"
        get "/:id/invoice", to: "invoice#show"
      end
      resources :invoice_items, only: [:index, :show]
    end
  end
end
