Rails.application.routes.draw do
  devise_for :users
  get 'home', to: 'home#index'
  get 'addresses', to: 'addresses#index'
end
