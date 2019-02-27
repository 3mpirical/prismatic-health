Rails.application.routes.draw do
  root "pages#home"

  devise_for :doctors, path: "doctors"
  devise_for :patients, path: "patients"

  resources :patients, only: [:show] do 
    resources :appointments, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :doctors, only: [:show]
end
