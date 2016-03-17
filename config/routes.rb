Rails.application.routes.draw do
  root 'top#index'
  get  'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'login'  => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  #railsが勝手にpostとpatchを使い分ける(謎)
  patch 'signup' => 'users#create'
  get 'puzzle' => 'puzzle#index'
  post 'puzzle' => 'puzzle#vote'
  get 'puzzle' => 'puzzle#win'
  get 'winners' => 'winners#show'
  post 'winners' => 'winners#create'
  get 'winners/new' => 'winners#new'

  resources :users
end
