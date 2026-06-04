Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  root "static_pages#top"

  resources :textbooks, only: [ :show ] do
    resources :lessons, param: :learning_mode, only: [ :show ] do
      resources :audios, only: [ :show ] do
        resource :favorite, only: [ :create, :destroy ]
        resource :learning_records, only: [ :create, :destroy ]
      end
    end
  end

  resources :favorites, only: [ :index ]
  resources :booklists, only: [ :index, :create, :destroy ]
end
