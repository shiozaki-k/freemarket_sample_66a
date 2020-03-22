Rails.application.routes.draw do
  devise_for :users
  get 'addresses', to: 'addresses#index'
end
