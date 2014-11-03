Blog::Application.routes.draw do
	devise_for :users

	resources :posts do
		resources :comments
	end

	root "posts#index"
	get '/about', to: 'pages#about'

	devise_scope :user do
		get "/admin" => "devise/sessions#new"
	end
end

