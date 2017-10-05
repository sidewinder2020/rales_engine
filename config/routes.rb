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
        get "/:id/revenue", to: "revenue#show"
        get "most_items", to: "most_items#index"
        get "/:id/items", to: "items#index"
        get "/:id/invoices", to: "invoices#index"
>>>>>>> 2c96b1547fe904d3860b8d3809cac09e1dadf7f8
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
        get "/:id/transactions", to: "transactions#index"
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
<<<<<<< HEAD
        get "/most_revenue", to: "most_revenue#index"
=======
        get "/:id/best_day", to: "best_day#show"
        get "most_items", to: "most_items#index"
        get "/:id/merchant", to: "merchant#show"
        get "/:id/invoice_items", to: "invoice_items#index"

>>>>>>> 2c96b1547fe904d3860b8d3809cac09e1dadf7f8
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
