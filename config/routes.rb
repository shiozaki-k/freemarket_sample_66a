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
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  resources :products do 
    # get 'buy'
    get  'products/purchase/:id', to: 'products#buy', as: 'purchase'
    post 'products/pay/:id', to: 'products#pay', as: 'pay'
    get  'products/done', to: 'products#done', as: 'done'
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end
  end

end
