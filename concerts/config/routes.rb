Rails.application.routes.draw do
  get '/auth/github/callback' => 'sessions#create'
  root 'welcome#home'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/logout', to: 'sessions#destroy'

  post '/purchaseticket', to: 'concerts#buy_tickets'

  post '/refund', to: 'concerts#refund'
  resources :users, only: [:show, :new, :create] do
  resources :concerts, only: [:show, :index, :new]
  end

  get '/most_popular', to: 'concerts#most_popular'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
