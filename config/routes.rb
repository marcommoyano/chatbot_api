Rails.application.routes.draw do
  root 'v1/transaction/deposit#index'

  namespace :v1 do
    namespace :transaction do
      resources :inquiry, only: [:index] do
        get :search, on: :collection
      end
      resources :deposit, only: [:index] do
        get :search, on: :collection
      end
    end

    namespace :indicator  do
      resources :economic, only: [:index] do
        get :search, on: :collection
      end
    end

    namespace :paper_roll  do
      resources :request, only: [:index] do
        get :search, on: :collection
        get :to_pdf, on: :collection, defaults: {format: 'pdf'}
      end
    end
  end
end
