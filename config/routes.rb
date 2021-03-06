Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  devise_for :admins, skip: [
    :registrations,
    # :sessions
    ], controllers: { sessions: "admins/sessions" }
  devise_scope :admin do
    scope :admins do
      get '/edit' => 'devise/registrations#edit', as: :edit_admin_registration
      put '' => 'devise/registrations#update', as: :admin_registration
    end
  end

  mount StripeEvent::Engine, at: '/stripe_webhooks'

  mount RailsAdmin::Engine => '/database', as: 'rails_admin'

  root to: "landings#show"

  namespace :users, as: :user do
    resource :signed_up
  end

  authenticate :user do
    resource :profile, only: [ :show ]
    resources :members, only: [ :show ] do
      resource :activity, only: [ :show ]
      resource :account, only: [ :show ], module: :members do
        resource :add_money, only: [ :new, :create ], module: :accounts
        resource :successful_checkout, only: [ :show ], module: :accounts
        resource :failed_checkout, only: [ :show ], module: :accounts
        # resource :payment, only: [ :new, :create ], module: :accounts
      end
      resources :plays, only: [ :index, :show, :create ] do
        resources :questions, only: [ :new, :show, :update ], module: :plays do
          resource :review, only: [ :show ]
        end
        resource :complete, only: [ :show, :create ], module: :plays
        resource :completed, only: [ :show ], module: :plays
        resource :pending, only: [ :show ], module: :plays
        resource :result, only: [ :show ], module: :plays
        resource :closed, only: [ :show ], module: :plays
      end
      resource :results, only: [ :show ], module: :members
      resources :news_posts, only: [ :index, :show ], module: :members
    end
    namespace :users, as: :user do
      resource :management, only: [ :show ]
      resource :termination, only: [ :show, :create ]
      resource :support, only: [ :new, :create ]
    end
  end

  authenticate :admin do
    authorize_admin( :developer ) do
      resource :datadump, only: [ :show ]
    end
    authorize_admin( :quizmaster ) do
      resource :quizmaster, only: [ :show ] do
        resources :news_posts do
          resource :status, only: [ :update ], module: :news_posts
        end
        resource :session_store, only: [ :update ]
        resources :accounts, only: [ :index, :show ]
        resources :quizzes, except: [ :new, :create ] do
          resource :tally, only: [ :new, :create ], module: :quizzes
          resources :plays, only: [ :index, :show ], module: :quizzes
          resource :status, only: [ :update ], module: :quizzes
        end
        resources :quizbooks, except: [ :edit, :update ] do
          resource :status, only: [ :update ], module: :quizbooks
          resources :quizzes, only: [ :new, :create ], module: :quizbooks
        end
        resources :questions, except: [ :index ] do
          resources :files, only: [ :show, :new, :create, :destroy], module: :questions
          resource :test, only: [ :show, :new, :create ], module: :questions
          resource :template, only: [ :edit, :update ], module: :questions
          resource :moveup, only: [ :create ], module: :questions
          resource :movedown, only: [ :create ], module: :questions
        end
      end
    end
    authorize_admin( :comptroller ) do
      resource :comptroller do
        resources :leagues, only: [ :index, :show, :new, :create, :destroy ]
        resources :accounts, only: [ :index, :show ]
        resource :transactor, only: [ :new, :create ]
      end
    end
  end

end
