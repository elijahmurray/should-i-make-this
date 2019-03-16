Rails.application.routes.draw do
  resources :products
  get 'page/index'
  devise_for :users

  root 'page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
