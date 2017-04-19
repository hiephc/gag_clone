Rails.application.routes.draw do
  resources :photos do
  resources :comments
  end
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'homepage#index'
  resources :comments do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
