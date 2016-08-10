Rails.application.routes.draw do
    resources :cats

    # post '/cat_rental_requests/:id/approve', to: 'cat_rental_requests#approve'
    # post '/cat_rental_requests/:id/deny', to: 'cat_rental_requests#deny'

    resources :cat_rental_requests do
      member do
        post 'approve'
        post 'deny'
      end
    end

end
