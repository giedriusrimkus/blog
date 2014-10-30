Blog::Application.routes.draw do
  devise_for :users
  resources :posts do
  	resources :comments
  end
  root "posts#index"

  get '/about', to: 'pages#about'
  match '/admin',  to: 'devise/sessions#new', via: 'get'

end
