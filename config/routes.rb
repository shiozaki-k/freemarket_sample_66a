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

  resources :items
  resources :products do 
    get 'buy'
    collection do
      get 'category_children' 
      get 'category_grandchildren'
      get  'purchase/:id'=>  'products#buy', as: 'purchase'
      post 'pay/:id'=>   'products#pay', as: 'pay'
      get  'done'=>      'products#done', as: 'done'
    end
  end

end

