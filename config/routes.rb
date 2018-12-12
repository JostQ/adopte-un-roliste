Rails.application.routes.draw do
  get 'roleplay/index'
  devise_for :users
  root 'home#index'
  get 'opinions', to: 'opinions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
