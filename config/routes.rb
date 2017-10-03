Rails.application.routes.draw do
 namespace :API do
    namespace :V1 do
      resources :invoices, only: [:index, :create]
    end
  end
end
