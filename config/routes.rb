Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks
  post 'tasks/complete/:id', to: 'tasks#complete'
  resources :users
  get 'signup' => 'users#new'
end
