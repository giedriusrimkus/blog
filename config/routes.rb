Blog::Application.routes.draw do
	devise_for :users

	resources :posts do
		resources :comments
	end

	root "posts#index"
	get '/about', to: 'pages#about'
	get '/contact', to: 'pages#contact'
	get 'tags/:tag', to: 'posts#index', as: :tag

	devise_scope :user do
		get "/admin" => "devise/sessions#new"
	end

	match '/contacts',     to: 'contacts#new',             via: 'get'
	resources "contacts", only: [:new, :create]
end