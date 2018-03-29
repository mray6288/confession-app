Rails.application.routes.draw do
	resources :confession_topics
	resources :topics
	resources :comments
	resources :confessions
	resource :users
	get '/profile', to: 'users#show', as: 'user'
	get '/signup',  to: 'users#new', as: 'signup'
	get '/login', to: 'sessions#new', as: 'login'
	get '/analytics', to: 'application#analytics', as: 'analytics'
	delete '/logout', to: 'sessions#destroy', as: 'logout'
	post '/sessions', to: 'sessions#create', as: 'sessions'
	root 'application#home'
end
