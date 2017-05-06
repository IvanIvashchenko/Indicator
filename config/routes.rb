Rails.application.routes.draw do
  root 'products#index'

  resources :products

  put 'products/:id/pro' => 'products#mark_as_pro', :as => 'mark_product'
  get 'products/:id/buy' => 'products#buy_product', :as => 'buy_product'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'sign_up/admin' =>'admins#new'
  post 'sign_up/admin' =>'admins#create'

  get 'sign_up/owner' =>'owners#new'
  post 'sign_up/owner' =>'owners#create'

  get 'sign_up/guest' =>'guests#new'
  post 'sign_up/guest' =>'guests#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
