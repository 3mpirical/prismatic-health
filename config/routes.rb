Rails.application.routes.draw do
  get 'doctors/edit'
  get 'doctors/show'
  get 'patients/edit'
  get 'patients/show'
  devise_for :doctors
  devise_for :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
