Rails.application.routes.draw do
  resources :products do
    resources :comments, only: [:create, :destroy] do
      member do
        put "like", to: "comments#upvote"
        put "dislike", to: "comments#downvote"
      end
    end
    member do
      put "like", to: "products#upvote"
      put "dislike", to: "products#downvote"
      put "follow", to: "products#follow"
      put "unfollow", to: "products#unfollow"
    end
  end

  get 'page/index'
  devise_for :users

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
