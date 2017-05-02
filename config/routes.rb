Rails.application.routes.draw do

  root 'products#index'

  resources :products


  # devise_for :admins, :controllers => {:registrations => 'registrations'}
  # devise_scope :admin do
  #   resource :registration,
  #     only: [:new, :update, :edit],
  #     path: 'users',
  #     path_names: { new: 'sign_up', login: 'sign_in', logout: 'sign_out'},
  #     # controller: 'registrations',
  #     as: :user_registration do
  #       get :cancel
  #     end
  # end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # devise_scope :admin do
  get "sign_up/admin" =>"admins#new"
  post "sign_up/admin" =>"admins#create"

  get "sign_up/owner" =>"owners#new"
  post "sign_up/owner" =>"owners#create"

  get "sign_up/guest" =>"guests#new"
  post "sign_up/guest" =>"guests#create"
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
