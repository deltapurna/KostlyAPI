Rails.application.routes.draw do
  get 'places' => 'places#index'
  get 'places/:id' => 'places#show'
  post 'places' => 'places#create'
end
