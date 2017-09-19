Rails.application.routes.draw do



  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  get '/home' => 'static_pages#home'
  get '/app_architecture' => 'static_pages#app_architecture'
  get '/about' => 'static_pages#about'
  get '/use_cases' => 'static_pages#use_cases'

  resources :users do
    resources :books
  end

  resources :books do
    resources :reviews
  end

  resources :books do
    resources :comments
  end

  root 'static_pages#home'
end

