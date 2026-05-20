Rails.application.routes.draw do
  root 'static_pages#top' 

  resources :textbooks, only: [:index, :show] do
    member do
      get :reading
      get :listening
    end
  end
end
