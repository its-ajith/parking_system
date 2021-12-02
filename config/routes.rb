Rails.application.routes.draw do

  root to: 'slots#index' 
  resources :slots
  post '/slots/:id' =>'slots#update'
  get '/signup' => 'admin/users#new'
  post '/signup' => 'admin/users#create'
  
  get '/login' => 'admin/sessions#new'
  post '/login' => 'admin/sessions#create'
  get '/logout' => 'admin/sessions#destroy'
  post '/admin/slots/:id'=>    'admin/slots#update'   
  
  namespace :admin do
    get 'home/index'
  end
  namespace :admin do
    resources :users
    resources :sessions
    resources :park_systems
    resources :slots
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
