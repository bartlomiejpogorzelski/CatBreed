Rails.application.routes.draw do
  get 'quizzes/new'
  get 'quizzes/create'
  get 'quizzes/show'
  devise_for :users # , controllers: {omniauth_callbacks: 'users/omniauth_callbacks' }
  
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'
  

  root "home#index"
  get '/home', to: 'home#index', as: :home

  scope module: "cats" do
    resources :kittens
    resources :parents
    resources :reservations, only: [:new, :create, :update]
  end
  namespace :admin do
    resources :cats, only: [:index, :new, :create, :update]
  end

  resources :contact_form, only: %i[new create]
  resources :posts do
    resources :comments
  end
  resources :quizzes, only: [:index] do
    post :submit_answer, on: :member
  end
  get "/pages/:page" => "pages#show",  as: 'pages'
  get '/unauthorized', to: 'unauthorized#show', as: 'unauthorized'
end
