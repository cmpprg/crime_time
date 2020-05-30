Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: "sessions#create"

  namespace :user do
    get '/dashboard', to: 'dashboard#show'
    get '/register_state', to: 'register#edit'
  end
end
