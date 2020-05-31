Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  namespace :user do
    get '/dashboard', to: 'dashboard#show'
    get '/register_state/:id/edit', to: 'register#edit'
    patch '/register_state/:id', to: 'register#update'
  end
end
