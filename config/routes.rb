Rails.application.routes.draw do
  resources :characters
  get 'adventure', to: 'adventure#create_and_research'
  post 'adventure', to: 'game_sessions#create'
  get 'adventure/:id', to: 'adventure#show'
  put 'adventure/:id', to: 'adventure#update'
  post 'adventure/character', to: 'adventure#create'
  post 'adventure/end_day/:id', to: 'adventure#end_day'
  get 'game_sessions', to: 'game_sessions#index'
  get 'profile/:id', to: 'profile#show'
  post 'character/add_character_to_session/:id', to: 'profile#add_character_to_session'
  get 'roleplay', to: 'roleplay#index'
  devise_for :users
  root 'home#index'
  get 'opinions', to: 'opinions#new'
  post 'opinions', to: 'opinions#create'
  post 'comments', to: 'comments#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
