Rails.application.routes.draw do
  root 'home#index'
  get 'dashboard', to: "dashboard#index"
  

  #Stripe
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
