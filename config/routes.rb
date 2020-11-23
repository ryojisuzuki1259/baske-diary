Rails.application.routes.draw do
  get 'events/show'
  get 'events/create'
  get 'events/update'
  get 'events/destroy'
  get 'skills/show'
  get 'skills/new'
  get 'skills/create'
  get 'skills/edit'
  get 'skills/update'
  get 'skills/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'diary_comments/create'
  get 'diary_comments/destroy'
  get 'diaries/show'
  get 'diaries/new'
  get 'diaries/create'
  get 'diaries/edit'
  get 'diaries/update'
  get 'diaries/destroy'
  get 'users/index'
  get 'users/show'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :diaries , except: [:index] do
    resources :diary_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :skills , except: [:index]
  resources :users, only: [:index, :show]
  resources :events , except: [:index]

end
