Rails.application.routes.draw do
  resources :mwo_builds
  resources :builds
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get "signin" => 'devise/sessions#new'
  	delete "signout" => 'devise/sessions#destroy'
  	get 'signup' => 'devise/registrations#new'
  end
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact-us' => 'pages#contact_us'
  get 'builds' => 'builds#index'
  get 'mwo_builds' => 'mwo_builds#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
