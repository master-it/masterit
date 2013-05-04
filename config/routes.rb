Masterit::Application.routes.draw do


  devise_scope :expert do
    post "users/omniauth_callbacks", to: "users/omniauth_callbacks#registration"
  end

  devise_scope :participant do
    post "users/omniauth_callbacks", to: "users/omniauth_callbacks#registration"
  end

  devise_scope :moderator do
    post "users/omniauth_callbacks", to: "users/omniauth_callbacks#registration"
  end

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => 'users/registrations' }

  devise_scope :admin do
    post "users/omniauth_callbacks", :to => "users/omniauth_callbacks#registration"
  end

  mount RailsAdmin::Engine => '/admin/rails_admin', :as => 'rails_admin'

  #root :to => "web/welcome#index"

  scope :module => :web do
    root :to => 'welcome#index'

    namespace :expert do
      resources :works, only: [:index, :show]
      resources :work_nominations, only: [:index, :show, :edit]
    end
    namespace :moderator do
      resources :works, only: [:index, :show, :edit]
      resources :experts, only: [:index, :show] do
        scope module: :experts do
          resources :works, only: [:index, :show] do
            member do
              put :set_works_to_expert
              put :remove_works_from_expert
            end
          end
          resources :nominations, only: [:index, :show] do
            member do
              put :set_nomination_to_expert
              put :remove_nomination_from_expert
            end
          end
        end
      end
    end

    namespace :admin do
      root to: "welcome#index"
      resources :work_nominations
      resources :works
      resources :regions
      resources :competitions
      resources :tours
      resources :users, only: [:index, :edit, :update]
      resources :moderators, only: [:index, :show]
      resources :experts, only: [:index, :show] do
        scope module: :experts do
          resources :works, only: [:index, :show] do
            member do
              put :set_works_to_expert
              put :remove_works_from_expert
            end
          end
          resources :nominations, only: [:index, :show] do
            member do
              put :set_nomination_to_expert
              put :remove_nomination_from_expert
            end
          end
        end
      end
      resources :moderators, only: [:index, :show] do
        scope module: :moderators do
          resources :regions, only: [:index, :show] do
            member do
              put :set_region_to_moderator
              put :remove_region_from_moderator
            end
          end
        end
      end
      resource :expert do 
        member do
          put :send_invite_to_expert
        end
      end
      resource :moderator do 
        member do
          put :send_invite_to_moderator
        end
      end
      resource :user, only: [] do
        member do
          put :invite_to_expert
          put :invite_to_moderator
        end
      end
      resources :menu_items do
        scope module: :menu_items do
          resources :pages
        end
      end
    end

    resources :competitions, only: [:index, :show] do
      scope module: :competitions do
        resources :work_nominations, only: [:index, :show] do
          member do
            get :new_plagiat
            put :plagiat_send
            put :remove_plagiat
            put :edit_plagiat
          end
        end
      end
    end
    resources :pages, only: [:show]
    resources :users, only: [:show, :edit, :update]
    resources :works
  end
end
