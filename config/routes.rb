Rails.application.routes.draw do
  devise_for :users

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
  post '/application_submission', to: 'application_submission#create'

  # user profile
  get '/profile', to: 'profile#index'
  get '/profile/edit', to: 'profile#edit'
  put '/profile', to: 'profile#update'
  delete '/profile', to: 'profile#destroy'

end
