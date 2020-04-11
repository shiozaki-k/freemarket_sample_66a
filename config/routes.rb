Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'addresses', to: 'addresses#index'

  resources :products

end
