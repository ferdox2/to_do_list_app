Rails.application.routes.draw do
  
  
  devise_for :users
  
  resources :lists do
    resources :tasks
  end
  mount Sidekiq::Web => '/sidekiq'

  devise_scope :user do
    authenticated :user do
      root to: 'lists#index'
    end
    unauthenticated :user do
      root to: 'devise/sessions#new'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
