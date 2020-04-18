Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resource :users do
    get 'edit'
  end
  resource :posts do
    get 'logout'
    get 'card'
    
  end
  get 'addresses', to: 'addresses#index'


  resources :products
  resources :items
  resources :products do 
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end

end
