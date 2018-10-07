Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'
  root 'users#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/logout', to: 'sessions#destroy'

  post '/buyticket', to: 'concerts#buy_tickets'

  post '/refund', to: 'concerts#refund'
  resources :users, only: [:show, :new, :create] do
  resources :concerts, only: [:show, :index, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
