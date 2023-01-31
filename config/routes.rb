Rails.application.routes.draw do
  get 'friendships/new'
  get 'friendships/create'
  get 'friendships/index'
  get 'friendships/show'
  get 'friendships/edit'
  get 'users/new'
  get 'users/index'
  get 'users/edit'
  get 'users/update'
  get 'users/show'
  get 'like/new'
  get 'like/create'
  get 'like/index'
  get 'like/show'
  get 'like/edit'
  devise_for :users, controllers: {
     sessions: 'users/sessions'
   }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "posts#index"
   resources :posts, :likes, :comments

end
