Rails.application.routes.draw do

  root to: 'clients#home'

  post 'authenticate' => 'sessions#authenticate'

  ########################################
  # Admin Client
  ########################################
  get '/admin',       to: 'clients#admin'
  get '/admin/*path', to: 'clients#admin'
  ########################################

  ########################################
  # Event Client
  ########################################
  get '/event',       to: 'clients#event'
  get '/event/*path', to: 'clients#event'
  ########################################

  namespace :api do
    ########################################
    # Admin Client API
    ########################################
    namespace :admin_client, path: 'admin-client' do
      resources :events,                   only: [ :index, :show, :create, :update, :destroy ]
      resources :locations,                only: [ :index, :show, :create, :update, :destroy ]
      resources :people,                   only: [ :index, :show, :create, :update, :destroy ]
      resources :organizations,            only: [ :index, :show, :create, :update, :destroy ]
      resources :organization_memberships, only: [ :index, :show, :create, :update, :destroy ]
      resources :organization_lists,       only: [ :index, :show, :create,          :destroy ]
      resources :users,                    only: [ :index, :show, :create, :update, :destroy ]
      namespace :mailchimp do
        resources :lists,                  only: [ :index                                    ] do
          resources :groups,               only: [ :index                                    ]
        end
      end
    end
    ########################################

    ########################################
    # Event Client API
    ########################################
    namespace :event_client, path: 'event-client' do
      resources :events,        only: [ :index, :show                             ]
      resources :locations,     only: [ :index, :show                             ]
      resources :organizations, only: [ :index, :show                             ]
      resources :volunteers,    only: [ :index, :show, :create, :update           ]
    end
    ########################################
  end
end
