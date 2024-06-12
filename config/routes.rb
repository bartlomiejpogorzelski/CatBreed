Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  scope module: "cats" do
    resources :kittens
    resources :parents
    resources :reservations, only: [:new, :create, :update]
  end
  namespace :admin do
    resources :cats, only: [:index, :new, :create]
  end

  resources :contact_form, only: %i[new create]
  resources :posts do
    resources :comments
  end
  get "/pages/:page" => "pages#show",  as: 'pages'
end
