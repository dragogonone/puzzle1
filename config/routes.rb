Rails.application.routes.draw do
  root 'top#index'
  get  'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'users' => 'users#create'
  get 'puzzle' => 'puzzle#index'
  post 'puzzle' => 'puzzle#vote'
  get 'puzzle' => 'puzzle#win'

  resources :users
end
