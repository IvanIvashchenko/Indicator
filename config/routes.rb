Rails.application.routes.draw do

  root 'products#index'

  resources :products


  devise_for :users, :controllers => {:registrations => 'registrations'}
  devise_scope :user do
    resource :registration,
      only: [:new, :update, :edit],
      path: 'users',
      path_names: { new: 'sign_up', login: 'sign_in', logout: 'sign_out'},
      # controller: 'registrations',
      as: :user_registration do
        get :cancel
      end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
