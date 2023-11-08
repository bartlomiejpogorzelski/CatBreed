Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"

  scope module: "cats" do
    resources :kittens
    resources :parents
  end
  namespace :admin do
    resources :cats, only: [:index, :new, :create]
  end
end
