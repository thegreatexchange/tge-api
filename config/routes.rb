Rails.application.routes.draw do

   resources :users, only: [ :index, :show, :create, :update, :destroy ], defaults: { format: :json }

end
