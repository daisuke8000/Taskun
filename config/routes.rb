Rails.application.routes.draw do
  get 'tasks/new' => 'tasks#new'
  root 'homes#index'
end
