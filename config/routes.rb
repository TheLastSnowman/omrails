Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get "signin", to: 'devise/sessions#new'
    delete "signout", to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end

  get 'feed', to: 'feed#show'

  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end
  
  resources :mwo_builds
  resources :builds
  resources :tweets
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact-us', to: 'pages#contact_us'
  get 'builds', to: 'builds#index'
  get 'mwo_builds', to: 'mwo_builds#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
