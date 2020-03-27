Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'posts#index'
  get 'items', to: 'items#new'
  
  
end
