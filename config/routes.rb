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

  get 'bright_ideas' => 'ideas#index'
  get 'bright_ideas/new'
  post 'bright_ideas' => 'ideas#create'
  get 'bright_ideas/:id' => 'ideas#show'
  get 'bright_ideas/edit'
  get 'bright_ideas/update'
  delete 'bright_ideas/destroy'

  get 'likes/index'
  get 'likes/new'
  get 'likes/:id' => "likes#create"
  get 'likes/show'
  get 'likes/edit'
  get 'likes/update'
  get 'likes/destroy'



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
end
