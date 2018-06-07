Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'home/index'
  get 'about/index'
  get 'about' => 'about#index'
  resources :posts do
    resources :comments
    member do
      put 'like', to: "posts#like"
      put 'unlike', to: "posts#unlike"
    end
  end
  get 'yourposts' => 'posts#userindex'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
