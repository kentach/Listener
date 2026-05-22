Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root 'static_pages#top' 

  resources :textbooks, only: [:show] do
    resources :readings, only: [:index, :show], path:'reading'
    resources :listenings, only: [:index, :show], path: 'listening'
    resources :shadowings, only: [:index, :show], path: 'shadowing'
  end

end
