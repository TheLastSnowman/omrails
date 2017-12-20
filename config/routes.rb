Rails.application.routes.draw do
  get 'users/:username', to: 'users#show', as: 'user'

  resources :mwo_builds
  resources :builds
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get "signin", to: 'devise/sessions#new'
  	delete "signout", to: 'devise/sessions#destroy'
  	get 'signup', to: 'devise/registrations#new'
  end
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact-us', to: 'pages#contact_us'
  get 'builds', to: 'builds#index'
  get 'mwo_builds', to: 'mwo_builds#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
