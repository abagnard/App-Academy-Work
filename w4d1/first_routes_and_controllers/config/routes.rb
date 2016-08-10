Rails.application.routes.draw do

  resources :users

#   Prefix Verb   URI Pattern               Controller#Action
#  users GET    /users(.:format)          users#index
#        POST   /users(.:format)          users#create
# new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#   user GET    /users/:id(.:format)      users#show
#        PATCH  /users/:id(.:format)      users#update
#        PUT    /users/:id(.:format)      users#update
#        DELETE /users/:id(.:format)      users#destroy

# get "/users", to: "users#index"
# post "/users", to: "users#create"
# get "/users/new", to: "users#new"
# get "/users/:id/edit", to: "users#edit"
# get "/users/:id", to: "users#show"
# patch "/users/:id", to: "users#update"
# put "/users/:id", to: "users#update"
# delete "/users/:id", to: "users#destroy"

end
