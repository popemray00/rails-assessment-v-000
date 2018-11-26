Rails.application.routes.draw do
  resources :notes
  get '/auth/:provider/callback' => 'sessions#create'
  root 'welcome#home'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/logout', to: 'sessions#destroy'

  post '/purchaseticket', to: 'concerts#buy_tickets'

  post '/refund', to: 'concerts#refund'

  get 'concerts/:id/concert_data', to: 'concerts#concert_data'

  resources :concerts
  
  resources :users do
    resources :notes
  end

  resources :users do
    resources :concerts
  end

  resources :concerts do
    resources :users
  end

  get '/order', to: 'concerts#order'
  
  get '/most_popular', to: 'concerts#most_popular'
end
