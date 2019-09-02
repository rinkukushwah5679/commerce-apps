Rails.application.routes.draw do
  devise_for :users
  get 'product_details/:id' => "home#product_details", as: :product_details
  get 'category_details/:id' => "home#category_details", as: :category_details
  get 'home/index'
  root 'home#index'
  namespace :admin, module: nil  do
    root "admin#index"
    resources :users
    resources :products
    resources :categories
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
