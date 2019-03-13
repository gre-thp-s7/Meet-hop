Rails.application.routes.draw do
  get 'users/new'
  get 'users/index'
  get 'users/create'
  get 'users/destroy'
  get 'users/update'
  get 'users/show'
  root 'home#index'
  get 'dashboard', to: "dashboard#index"
<<<<<<< HEAD
  
  resources :events
=======

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
>>>>>>> a56e1a75a50426e4bb36c7d6611f107689ca0f64

  post "events/registration/:id", to: "events#registration", as: "event_registration"
  
  #Stripe
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
