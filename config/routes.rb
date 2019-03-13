Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'dashboard', to: "dashboard#index"
  
  resources :events

  post "events/registration/:id", to: "events#registration", as: "event_registration"
  
  #Stripe
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
