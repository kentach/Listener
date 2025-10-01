Rails.application.routes.draw do
  root "static_pages#top"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

end
