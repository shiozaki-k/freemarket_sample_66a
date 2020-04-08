Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'user/edit' 
  resource :posts do
    get 'logout'
    get 'card'
    
  end
  get 'addresses', to: 'addresses#index'

end
