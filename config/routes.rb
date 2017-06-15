Rails.application.routes.draw do
	root 'users#new'
	post '/users' => 'users#create'
	get '/users/:user_id' => 'users#show'

	post '/sessions' => 'sessions#create'
	delete 'sessions/:id' => 'sessions#destroy'

	get '/secrets' => 'secrets#index'
	post '/secrets' => 'secrets#create'
	delete '/secrets/:secret_id' => 'secrets#destroy'
	get '/secrets/:secret_id/likes' => 'secrets#like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
