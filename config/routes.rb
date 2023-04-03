Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'main#index'
  root 'main#home'

  # resources pages
  get '/spay_and_neuter', to: 'resource_pages#spay_and_neuter'
  get '/muzzles', to: 'resource_pages#muzzles'
  get '/microchipping', to: 'resource_pages#microchipping'
  get '/fencing', to: 'resource_pages#fencing'
  get '/leashes_and_harnasses', to: 'resource_pages#leashes_and_harnasses'

  resources :animal_rescues
end
