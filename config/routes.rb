Rails.application.routes.draw do
  resources :photos
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'homepage#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
