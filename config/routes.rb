Rails.application.routes.draw do

  root "sessions#new"
  get 'sessions' => 'sessions#index' 
  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'

  get 'users/new' => 'users#new'
  get 'users/:id' => 'users#show'
  post 'users/create' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
  get 'users/update'
  delete 'users/:id' => 'users#destroy'

  get 'secrets' => 'secrets#index'
  post 'secrets/create' => 'secrets#create'
  delete 'secrets/:id' => "secrets#destroy"

  post 'likes' => 'likes#create'
  delete 'likes/:id' => 'likes#destroy'


  
  # > rake routes
  #    Prefix Verb   URI Pattern               Controller#Action
  #      root GET    /                         users#index
  #     users GET    /users(.:format)          user#index
  #           GET    /users/:id(.:format)      user#show
  # users_new GET    /users/new(.:format)      user#new
  #           GET    /users/:id/edit(.:format) user#edit
  #           POST   /users(.:format)          user#create
  #  users_id PATCH  /users/:id(.:format)       user#update
  #           DELETE /users/:id(.:format)      user#destroy
  
    # root 'users#index'
    # get 'users' => 'user#index'  #welcome page.
    # get 'users/:id' => 'user#show'  #A page that displays information for the user with the id specified
    # get 'users/new' => 'user#new' #page to allow adding a new user  
    # get 'users/:id/edit' => 'user#edit' #A page that allows the user to edit existing user information
    # post 'users' => 'user#create'  #A URL that processes the information submitted by the new method; in other words to create a new user.
    # patch 'users/:id' => 'user#update' #A URL that processes the information submitted by the edit method; in other words to update a particular user's information.
    # delete 'users/:id' => 'user#destroy' #A URL that allows a user to be deleted
end
