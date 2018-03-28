Rails.application.routes.draw do
	resources :confession_topics
	resources :topics
	resources :comments
	resources :confessions

	resource :users, only: [:create]
	get '/profile', to: 'users#show', as: 'user'
	get '/signup',  to: 'users#new', as: 'signup'
	get '/login', to: 'sessions#new', as: 'login'
<<<<<<< HEAD
	delete '/logout', to: 'sessions#destroy', as: 'logout'
=======
	delete 'logout', to: 'sessions#destroy', as: 'logout'
>>>>>>> 6e68e3eee2f8e591f04140dc73cfd11c63c7ffd8
	post '/sessions', to: 'sessions#create', as: 'sessions'
	root 'application#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
