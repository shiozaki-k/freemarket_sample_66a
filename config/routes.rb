Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get 'addresses', to: 'addresses#index'

end
