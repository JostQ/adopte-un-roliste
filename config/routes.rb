Rails.application.routes.draw do
  resources :characters
  get 'adventure', to: 'adventure#create_and_research'
  post 'adventure', to: 'game_sessions#create'
  get 'adventure/:id', to: 'adventure#show'
  post 'adventure', to: 'adventure#create'
  get 'game_sessions', to: 'game_sessions#index'
  get 'profile/:id', to: 'profile#show'
  get 'roleplay/index'
  devise_for :users
  root 'home#index'
  get 'opinions', to: 'opinions#new'
  post 'opinions', to: 'opinions#create'
  post 'comments', to: 'comments#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
