Rails.application.routes.draw do
  root "contacts#index"

  resources :contacts, only: [:index] do
    member do
      post :preview
    end
  end

  resources :email_templates do
    member do
      post :preview
    end
  end
end
