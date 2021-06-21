Rails.application.routes.draw do
  devise_for :users
  
  resources :profiles
  resources :points


  

  resources :products do
    collection do
      get :store
    end
  end


  get 'administrators', to: 'administrators#index'
  get 'toggle_admin', to: 'administrators#toggle_admin'

  resources :orders
  resources :carts
  resources :profits
  resources :deliveries
  resources :banks
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'line_items' => "line_items#create"

  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"


  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"

  root "products#store"
end
