Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root 'static_pages#top' 

  resources :textbooks do
    resources :lessons, param: :learning_mode do
      resources :audios
    end
  end
end
