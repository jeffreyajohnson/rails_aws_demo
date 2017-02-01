Rails.application.routes.draw do


  root "session#new"
  get 'session' => 'session#index' 
  get 'session/new' => 'session#new'
  post 'session' => 'session#create'
  delete 'session' => 'session#destroy'

  get 'user/new' => 'user#new'
  get 'user/:id' => 'user#show' 
  post 'user/create' => 'user#create'
  get 'user/:id/edit' => 'user#edit' 
  patch 'user/:id' => 'user#update'
  get 'user/update'
  delete 'user/:id' => 'user#destroy'

  get 'event' => 'event#show'
  get 'event/new'
  post 'event/create' => 'event#create'
  get 'event/:id/edit' => 'event#edit'
  get 'event/show'
  patch 'event/:id' => 'event#update'
  get 'event/delete'

  post 'join/:id' => 'join#create'
  delete 'join/:id' => 'join#destroy'
  
end

# > rake routes
#      Prefix Verb   URI Pattern              Controller#Action
#        root GET    /                        session#new
#     session GET    /session(.:format)       session#index
# session_new GET    /session/new(.:format)   session#new
#             POST   /session(.:format)       session#create
#             DELETE /session(.:format)       session#destroy
#    user_new GET    /user/new(.:format)      user#new
#             GET    /user/:id(.:format)      user#show
# user_create POST   /user/create(.:format)   user#create
#             GET    /user/:id/edit(.:format) user#edit
#             PATCH  /user/:id(.:format)      user#update
# user_update GET    /user/update(.:format)   user#update
#             DELETE /user/:id(.:format)      user#destroy