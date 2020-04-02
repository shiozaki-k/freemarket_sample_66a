Rails.application.routes.draw do
  root to: "posts#index"

  get 'user/edit'
  get 'posts/logout'
end
