Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resource :profile
      resources :courses, only: %i[index show] do
        resource :words, only: %i[show], module: :courses
      end
      resource :users, only: %i[destroy]
      resources :general_announcements, only: %i[index show]
      resources :words, only: [] do
        resource :records, only: %i[show update], module: :words
      end
    end

    namespace :v2 do
      resources :courses, only: %i[index show]
    end
  end
end
