Rails.application.routes.draw do
  devise_for :users

  get '/phantom', to: 'main#phantom'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'main#index'

  # about pages
  get '/code_of_ethics', to: 'code_of_ethics#index'
  get '/what_is_era', to: 'what_is_era#index'
  get '/faq', to: 'faq#index'
  get '/contact_us', to: 'contact_us#index'
  post '/contact_us', to: 'contact_us#create'

  # application submission pages
  get '/become_a_member', to: 'application_funnel#index'
  get '/application_submitted', to: 'application_funnel#show'
  post '/create_new_application', to: 'application_funnel#create'

  # resources
  get '/rescues', to: 'rescues#index'
  get '/rescues/:id', to: 'rescues#show', as: 'rescue'

  #donate
  get '/donate', to: 'donate#index'

  # webhooks
  post '/webhooks/application_submitted', to: 'webhooks/application_submission#update'

  # admin namespace
  namespace :admin do
    get '/', to: 'dashboard#index'

    resources :organizations
    resources :application_submissions
  end
end
