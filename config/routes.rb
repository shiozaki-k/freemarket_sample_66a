Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
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
    resources :comments, only: [ :create, :destroy]
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end
    resources :products, shallow: true do
      resource :bookmarks, only: %i[create destroy]
      get :bookmarks, on: :collection
    end

  end

end
