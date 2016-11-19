Rails.application.routes.draw do


  root 'static_pages#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  get '/home' => 'static_pages#home'
  get '/app_architecture' => 'static_pages#app_architecture'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/signup' => 'users#new'

  resources :users do
    resources :books
  end

  resources :books do
    resources :reviews
  end

end

