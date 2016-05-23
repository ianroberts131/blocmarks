Rails.application.routes.draw do 
  devise_for :users
  
  authenticated :user do
    resources :topics do
      resources :bookmarks, except: [:index]
    end
    root to: "topics#index", as: :authenticated_root
  end
  root 'welcome#home'
  
end
