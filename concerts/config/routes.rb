Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'sessions#create'
  root 'welcome#home'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/logout', to: 'sessions#destroy'

  post '/purchaseticket', to: 'concerts#buy_tickets'

  post '/refund', to: 'concerts#refund'

  post '/tickets', to: 'tickets#create'

  resources :users, only: [:show, :new, :create] do
    resources :concerts, only: [:show, :index, :new]
  end

  resources :users do
    resources :tickets, only: [:new, :show, :index, :create]
  end

  get '/most_popular', to: 'concerts#most_popular'
end
