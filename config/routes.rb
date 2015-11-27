Rails.application.routes.draw do
  devise_for :users

  scope :reports do
    get :subjects, to: 'reports#subjects', :as => 'report_subjects'
  end

  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  get :visitors, to: 'visitors#index'

  root to: 'visitors#index'
end
