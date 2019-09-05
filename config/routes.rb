Rails.application.routes.draw do
  resources :carts
  
  devise_for :users
  get 'home/index'
  get 'home/bsupplier'
  get 'home/brequirement'
  get 'home/sadvertise'
  get 'home/spost'
  get 'home/cbuy'
  get 'home/csection'
  get 'home/about'
  get 'home/contact'
  root 'home#index'
  get 'product_details/:id' => "home#product_details", as: :product_details
  get 'category_details/:id/products' => "home#category_details", as: :category_details
  get "wishlist" => "products#wishlist" 
  resources :products, except: [:new, :index, :edit, :show] do
    get :add_wishlist
    get :remove_wishlist
    get :add_cart
    get :remove_cart
  end

  namespace :admin, module: nil  do
    root "admin#index"
    resources :users
    resources :products
    resources :categories
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
