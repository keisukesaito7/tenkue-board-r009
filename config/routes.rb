Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "posts#index"
  resources :posts, except: :index
  post 'posts/:post_id/likes', to: 'likes#create', as: 'post_likes'
  delete 'posts/:post_id/likes', to: 'likes#destroy', as: 'post_like'
end
