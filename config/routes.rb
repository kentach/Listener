Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root 'static_pages#top' 

  resources :textbooks, only: [:index, :show] do
    member do
      get :reading
      get :listening
    end
  end
end
