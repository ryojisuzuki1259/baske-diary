Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :diaries do
    resources :diary_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :skills , except: [:index]
  resources :users, only: [:index, :show]
  resources :events , except: [:index]

end
