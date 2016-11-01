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

    namespace :event_client, path: 'event-client' do
      resources :volunteers, only: [ :index, :show, :create, :update           ]
      resources :locations,  only: [ :index, :show                             ]
      resources :schools,    only: [ :index, :show                             ]
      resources :ministries, only: [ :index, :show                             ]
      resources :events,     only: [ :index, :show                             ]
    end
  end
end
