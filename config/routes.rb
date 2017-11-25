Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :comments, only: [:create], shallow: true do
      resource :like, only: [:create, :destroy]
    end
  end
  
  controller :users do
    get 'registration' => :new
    post 'registration' => :create
  end

  controller :sessions do
    get 'login' => :login
    post 'login' => :create
    delete 'logout' => :logout
  end
end
