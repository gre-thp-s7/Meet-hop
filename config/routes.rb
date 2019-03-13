Rails.application.routes.draw do
  get 'users/new'
  get 'users/index'
  get 'users/create'
  get 'users/destroy'
  get 'users/update'
  get 'users/show'
  root 'home#index'
  get 'dashboard', to: "dashboard#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  #Stripe
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
