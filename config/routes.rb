Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  root to: redirect('/posts')

  resources :posts do
    resources :comments, only: [:create] do
      resource :like, only: [:create, :destroy]
    end
  end

  get '/registration' => 'users#new'
  post '/registration' => 'users#create'
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
