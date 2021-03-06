Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "posts#index"
  resources :posts, except: [:index] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end
