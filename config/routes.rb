Rails.application.routes.draw do

  post 'authenticate' => 'sessions#authenticate'

  # Clients
  get 'admin', controller: 'clients', action: :admin
  get 'event', controller: 'clients', action: :event

  namespace :api do
    namespace :admin do
      resources :users,      only: [ :index, :show, :create, :update, :destroy ]
      resources :people,     only: [ :index, :show, :create, :update, :destroy ]
      resources :locations,  only: [ :index, :show, :create, :update, :destroy ]
      resources :schools,    only: [ :index, :show, :create, :update, :destroy ]
      resources :ministries, only: [ :index, :show, :create, :update, :destroy ]
      resources :events,     only: [ :index, :show, :create, :update, :destroy ]
    end
  end
end
