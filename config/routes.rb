Rails.application.routes.draw do
  get 'registrations/index'
  get 'registrations/new'
  get 'registrations/show'
  get 'registrations/create'
  get 'registrations/edit'
  get 'registrations/destroy'

  root 'home#index'
  get 'dashboard', to: "dashboard#index"

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users
  resources :events


  #Stripe
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
