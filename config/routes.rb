Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #WAVE 2
  resources :movies, only: [:index, :show, :create]
  resources :customers, only: [:index]

  # get '/customers', to: 'customer#index', as: 'list_customers'
  # get '/movies', to: 'movies#index', as: 'list_movies'
  # get '/movies/:id', to: 'movies#show', as: 'movie_show'
  # post 'movies', to: 'movies#create', as: 'create_movie'

#QUERY PARAMS [ALL SHOULD SUPPORT]
  # Name	Value	Description
  # sort	string	Sort objects by this field, in ascending order
  # n	integer	Number of responses to return per page
  # p	integer	Page of responses to return

  #WAVE 3
  # post '/rentals/overdue', to: ''
  # get '/movies/:id/current'
  # get '/movies/:id/history'
  # get '/customers/:id/current'
  # get '/movies/:id/current'
  # get '/customers/:id/history'
end
