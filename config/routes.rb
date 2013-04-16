Masterit::Application.routes.draw do


  devise_for :users, :controllers => { 
    :omniauth_callbacks => "users/omniauth_callbacks", 
    :registrations => 'users/registrations' } 

  devise_scope :admin do
    post "users/omniauth_callbacks", :to => "users/omniauth_callbacks#registration"
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => "web/welcome#index"

  scope :module => :web do
    root :to => 'welcome#index'
    resources :users, only: [:show, :edit, :update]
    resources :works
    resource :comments
  end
end
