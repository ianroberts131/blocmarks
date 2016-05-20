Rails.application.routes.draw do  devise_for :users
  
  authenticated :user do
    resources :topics
  end
  root 'welcome#home'
  
end
