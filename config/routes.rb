Rails.application.routes.draw do
  resources :questions
  resources :surveys
  resources :survey_creators
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'survey_creators#login'
  get './persist', to: 'survey_creators#persist'
end
