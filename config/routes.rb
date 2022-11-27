Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks
  post 'tasks/complete/:id' => 'tasks#complete'
  resources :users
  get 'signup' => 'users#new'
  resource :session, only: [:new, :create, :destroy]
  get 'signin' => 'sessions#new'
end
