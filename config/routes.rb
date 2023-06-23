Rails.application.routes.draw do
  post 'auth/login' => 'auth#login'
  get 'auth/auto_login' => 'auth#auto_login'
  get 'auth' => 'auth#check'
  
  get 'users/index' => 'users#index'
  post 'users/create' => 'users#create'

  get 'rooms/index' => 'rooms#index'
  get 'rooms/members/:room_id' => 'rooms#members'
  post 'rooms/create' => 'rooms#create'

  get 'chats/:room_id' => 'chats#index'
  post 'chats/create' => 'chats#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
