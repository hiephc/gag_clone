Rails.application.routes.draw do
  devise_for :admins
  namespace :manages do
    resources :photos
    resources :users
  end
  resources :photos do
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"
    end
    resources :comments
  end
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'homepage#index'
  resources :comments do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
