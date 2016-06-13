Rails.application.routes.draw do 
  get 'users/show'

  get 'likes/index'

  devise_for :users
  
  post :incoming, to: 'incoming#create'
  
  authenticated :user do
    resources :users, only: [:show]
    resources :topics do
      resources :bookmarks, except: [:index]
    end
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
    end
    root to: "users#show", as: :authenticated_root
  end
  root 'welcome#home'
end
