Rails.application.routes.draw do
	resources :confession_topics
	resources :topics
	resources :comments
	resources :confessions

	resource :users, only: [:create]
	get '/profile', to: 'users#show', as: 'user'
	get '/signup',  to: 'users#new', as: 'signup'
	get '/login', to: 'sessions#new', as: 'login'
	post 'logout', to: 'sessions#destroy', as: 'logout'
	post '/sessions', to: 'sessions#create', as: 'sessions'
	root 'application#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
