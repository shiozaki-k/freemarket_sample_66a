Rails.application.routes.draw do
  get 'cards/new'
  get 'cards/show'
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
    end
  end

  resources :cards,only:[:index,:new,:show]do
  collection do
    #payjpでトークン化を行う
    post 'pay', to: 'cards#pay'
    #カード削除
    post 'delete', to: 'cards#delete'
    #カード情報入力
    post 'show', to: 'cards#show'
  end
end

end
