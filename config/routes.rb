Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'addresses', to: 'addresses#index'

  resources :products, except: :show
  resources :products do 
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end
  end
end
