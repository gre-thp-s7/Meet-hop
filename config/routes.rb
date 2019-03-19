Rails.application.routes.draw do

  root 'home#index'
  get 'dashboard', to: "dashboard#index"

  devise_for :users

  resources :users
  
  resources :events do
    resources :registrations
      resources :charges
  end
  
  #Stripe
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
