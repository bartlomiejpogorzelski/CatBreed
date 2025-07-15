Rails.application.routes.draw do
  get 'quizzes/new'
  get 'quizzes/create'
  get 'quizzes/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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

  namespace :ecommerce do
    resource :cart, only: [:show], controller: 'cart' do
      post 'add/:product_id', to: 'cart#add', as: 'add'
      delete 'remove/:product_id', to: 'cart#remove', as: 'remove'
      delete 'clear', to: 'cart#clear', as: 'clear'
    end
    resources :products, only: [:index]
  end

  get "/pages/:page" => "pages#show",  as: 'pages'
  get '/unauthorized', to: 'unauthorized#show', as: 'unauthorized'
end
