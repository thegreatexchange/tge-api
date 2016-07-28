Rails.application.routes.draw do

   post 'authenticate' => 'sessions#authenticate'
   resources :users,  only: [ :index, :show, :create, :update, :destroy ]
   resources :people, only: [ :index, :show, :create, :update, :destroy ]

end
