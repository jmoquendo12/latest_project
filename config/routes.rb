Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  namespace :api do
    resources :regions, only: :index, defaults: { format: :json } do
      resources :provinces, only: :index, defaults: { format: :json } do
        resources :city_municipalities, only: :index, defaults: { format: :json } do
          resources :barangays, only: :index, defaults: { format: :json }
        end
      end
    end
  end

  constraints(AdminDomainConstraint.new) do
    namespace :admin, path: '' do
      devise_for :users, controllers: {
        sessions: 'admins/sessions'
      }
      root to: "home#index"
      resources :users
      resources :items do
        put :start
        put :pause
        put :end
        put :cancel
      end
      resources :categories
    end
  end

  constraints(ClientDomainConstraint.new) do
    devise_for :users, controllers: {
      sessions: 'users/sessions', registrations: 'users/registrations'
    }
    root to: "members#index"
    resource :members, path: '' do
      get "update_profile"
    end
    resources :addresses
    resources :invites
    resources :lotteries
  end
end