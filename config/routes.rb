Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :notifications, only: :index
      resources :products, only: [:new, :create]
    end
  end
end
