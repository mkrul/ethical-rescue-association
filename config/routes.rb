Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'main#index'
  # root 'main#home'

  # resources pages
  get '/spay_and_neuter', to: 'resource_pages#spay_and_neuter'
  get '/products', to: 'resource_pages#products'
  get '/microchipping', to: 'resource_pages#microchipping'
  get '/fencing', to: 'resource_pages#fencing'

  # about pages
  get '/code_of_ethics', to: 'about_pages#code_of_ethics'
  get '/what_is_era', to: 'about_pages#what_is_era'
  get '/faq', to: 'about_pages#faq'

  resources :animal_rescues
end
