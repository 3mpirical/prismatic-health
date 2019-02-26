Rails.application.routes.draw do
  get 'pages/home'
  root "pages#home"

  devise_for :doctors
  devise_for :patients

  resources :patients, only: [:show] do 
    resources :appointments, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :doctors, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
