Rails.application.routes.draw do
  get 'users/new'

  get 'login/index'

  resources :products

  root 'login#index'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
