Rails.application.routes.draw do
  devise_for :users

  get :subjects, to: 'reports#subjects'

  resources :students do
    get :subjects
  end

  resources :teachers

  get :visitors, to: 'visitors#index'
end
