Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :calculators, only: [:index, :create, :destroy, :update]
    end
  end

  resources :calculators, only: [:index, :create, :destroy, :update]
  root to: 'calculators#show'
  # root to: 'site#index'
end
