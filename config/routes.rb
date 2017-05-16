Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'logins#new'

  resources :users, only: [:index] do
    resources :categories, only: [:index] do
      resources :subject_pages
    end
  end

  resources :logins, only: [:new, :create]
  resources :categories

  match 'login' => 'logins#destroy', via: 'delete', as: 'logout'

  namespace :admin do
    resources :users
  end
end
