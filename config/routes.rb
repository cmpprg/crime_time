Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: "sessions#create"
end
