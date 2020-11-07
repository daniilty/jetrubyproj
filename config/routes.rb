Rails.application.routes.draw do
  get 'items/new'
  post 'itemc', to: 'items#create'
  delete 'maind/:id', to: 'items#delete'
  get 'orders', to: 'orders#rest'
  post 'orders/create', to: 'orders#create'
  get 'drink/new'
  get 'orders/index'
  get 'menu/show'
  get 'menu/new'
  get 'registered/index'
  get 'weekday/menu'
  root 'dashboard#index'
  devise_for :users
  get 'weekday/menu/:id', to: 'weekday#menu' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
