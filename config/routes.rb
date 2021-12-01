Rails.application.routes.draw do

  namespace :admin do
    get 'slots/new'
    get 'slots/index'
  end
  get '/signup' => 'admin/users#new'
  post '/signup' => 'admin/users#create'
  
  get '/login' => 'admin/sessions#new'
  post '/login' => 'admin/sessions#create'
  get '/logout' => 'admin/sessions#destroy'
  
  namespace :admin do
    get 'home/index'
  end
  namespace :admin do
    resources :users
    resources :sessions
    resource :park_system

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
