Rails.application.routes.draw do
 namespace :API do
    namespace :V1 do
      namespace :invoices do
        get "find_all", to: "search#index"
        get "find", to: "search#show"
      end
      resources :invoices, only: [:index, :show]
    end
  end
end
