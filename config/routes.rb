Rails.application.routes.draw do
  resources :users

  root "tasks#index"

  resources :tasks
  # auto get url
  # PUT /tasks/:id
  #
  #tasks/complete/:id
  post 'tasks/complete/:id', to: 'tasks#complete'
end
