Rails.application.routes.draw do
	root 'static_pages#home'

	resources :users
	resources :attractions

	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create'
	delete 'signout', to: 'sessions#destroy'
end