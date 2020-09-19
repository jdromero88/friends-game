Rails.application.routes.draw do
  resources :states
  # get '/states/search', to: 'states#search'
  get '/state/search', to: 'states#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
