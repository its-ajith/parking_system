Rails.application.routes.draw do

  root to: 'slots#index' 
  resources :slots
  post '/slots/:id' =>'slots#update'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/admin/slots/:id'=>    'admin/slots#update'   
  
  namespace :admin do
    get 'home/index'
  end
  namespace :admin do
    resources :sessions
    resources :park_systems
    resources :slots
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
