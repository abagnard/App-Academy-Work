Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :subs, except: :destroy
  resources :posts, except: :index

  resources :posts do
    resources :comments, only: [:new, :create, :show]
  end

end
