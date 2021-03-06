Rails.application.routes.draw do
  
  root 'pages#home'
  get '/home', to: 'pages#home'
  
  resources :recipes do
    member do
      post 'like'
      post 'delete_review'
    end  

  end  
  
  resources :chefs, except: [:new, :destroy]
  
  get '/register', to: 'chefs#new'
  
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get 'logout', to: 'logins#destroy'
  get '/myrecipes', to: 'recipes#myrecipes'
  post '/new_review', to: 'recipes#new_review'
  

  
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  
end
