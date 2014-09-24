Rails.application.routes.draw do
  devise_for :employees
  devise_for :customers, controllers: {
    registrations: 'customers/registrations'
  }

  namespace :customer do
    resources :dashboards, only: [:index]
  end

  resources :customers

  namespace :api do
    namespace :v3 do
      resources :vehicles, only: [:show, :create, :update]
      resources :access_passes, only: [:create]
      resources :locations, only: [:index]
    end
  end

  root 'landing_page#index'
end
