Rails.application.routes.draw do
  devise_for :users

  get :subjects, to: 'reports#subjects'

  resources :students do
    get :subjects
  end
end
