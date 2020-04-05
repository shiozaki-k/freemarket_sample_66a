Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'user/edit'
  get 'posts/logout'
  get 'posts/card'
  get 'addresses', to: 'addresses#index'
  get 'posts', to: 'posts#index'

end
