Rails.application.routes.draw do
  root "pages#home"


  devise_for :doctors, path: "doctors"
  delete "doctors/:id" => "doctors#destroy"
  get "doctors/:id/appointments/:id" => "doctors#show_doctor_apps"

  devise_for :patients, path: "patients"

  resources :patients, only: [:show, :delete] do 
    resources :appointments, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :doctors, only: [:index, :show]

end
