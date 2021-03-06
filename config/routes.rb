Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'books#index'
	resources :books, only: [:index, :show]
	post '/books/:id', to: 'books#addatr'
	delete '/books/:id', to: 'books#delatr'

	get '/search', to: 'search#index'
	get '/sitemaps', to: 'sitemaps#index'

	get '/categories', to: 'categories#index'
	get '/categories/:category', to: 'categories#show'
  get '/tags', to: 'tags#index'
  get '/tags/:tag', to: 'tags#show'
  get '/artists', to: 'artists#index'
  get '/artists/:artist', to: 'artists#show'
end
