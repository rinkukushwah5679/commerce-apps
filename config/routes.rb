Rails.application.routes.draw do

  # resources :cart_items
  resources :addresses
  resources :reviews
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
  get "favorite" => "products#favorite" 
  resources :products, except: [:new, :index, :edit, :show] do
    get :add_wishlist
    get :remove_wishlist
    get :add_favorite
    get :remove_favorite
    get :add_cart
    get :remove_cart 
    get 'report_pdf' => 'products#report_pdf'
  end
  get "/update_cart_item_quantity/:type/:cart_item_id" => "carts#update_cart_item_quantity", as: :update_cart_item_quantity

  get 'order_pdf' => 'orders#order_pdf'

  resources :orders  
    
  resources :carts do
  # resources :orders
  end

  namespace :admin, module: nil  do
    root "admin#index"
    resources :users
    resources :products
    resources :categories
    # resources :orders
    get 'deleted_product' => 'products#deleted_product'
    get 'order_product' => 'orders#order_product'
    get 'display_report' => 'admin#display_report'
    
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
