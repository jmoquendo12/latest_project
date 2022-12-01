Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #

  constraints(AdminDomainConstraint.new) do
    namespace :admin, path: '' do
      devise_for :users, controller: {
        sessions: 'admins/sessions'
      }
      root to: "home#index"
      resources :users
    end
  end
  constraints(ClientDomainConstraint.new) do
    devise_for :users, controller: {
      sessions: 'users/sessions', registration: 'users/registrations'
    }
    root to: "members#index"
    resource :members do
      get "update_profile"
    end
    # resources :members
  end
end