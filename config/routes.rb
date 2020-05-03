Rails.application.routes.draw do
  get 'buyers/index'
  get 'buyers/done'
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
  


  
  resources :items
  resources :products do 
    get 'addresses', to: 'addresses#index'
    get 'buy'
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end
    resources :buyers, only: [:index] do
      collection do
        get 'done', to: 'buyers#done'
        post 'pay', to: 'buyers#pay'
      end
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
