Rails.application.routes.draw do

   post 'authenticate' => 'sessions#authenticate'

   namespace :api do
     namespace :admin do
       resources :users,  only: [ :index, :show, :create, :update, :destroy ]
       resources :people, only: [ :index, :show, :create, :update, :destroy ]
     end
   end
end
