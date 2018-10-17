Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_for :admins, skip: [ :registrations ], controllers: { sessions: "admins/sessions" }
  devise_scope :admin do
    scope :admins do
      get '/edit' => 'devise/registrations#edit', as: :edit_admin_registration
      put '' => 'devise/registrations#update', as: :admin_registration
    end
  end

  mount RailsAdmin::Engine => '/database', as: 'rails_admin'

  root to: "landings#show"
  authenticated :admin do
    root to: "quizmasters#show", as: :admin_root
  end
  authenticated :user do
    root to: "homes#show", as: :user_root
  end

  authenticate :user do
    resource :home, only: [ :show ]
    resources :plays, only: [ :index, :create ] do
      resources :questions, only: [ :new, :show, :update ], module: :plays do
        resource :review, only: [:show]
      end
      resource :complete, only: [ :show ], module: :plays
      resource :result, only: [ :show ], module: :plays
    end
    namespace :users, as: :user do
      resource :management, only: [ :show ]
      resource :termination, only: [ :show, :create ]
      resource :profile
    end
  end

  authenticate :admin do
    resource :session_store, only: [ :update ]
    # authorize_admin( :developer ) do
      resource :datadump, only: [ :show ]
    # end
    # authorize_admin( :quizmaster ) do
      resource :quizmaster, only: [ :show ]
      resources :quizzes do
        resource :recalculate, only: [ :create ], module: :quizzes
        resource :enqueue, only: [ :create ], module: :quizzes
        resource :dequeue, only: [ :create ], module: :quizzes
        resource :start_playing, only: [ :create ], module: :quizzes
        resource :stop_playing, only: [ :create ], module: :quizzes
      end

      resources :questions, except: [ :index ] do
        resources :files, only: [ :show, :new, :create, :destroy], module: :questions
        resource :test, only: [ :show, :new, :create ], module: :questions
        resource :template, only: [ :edit, :update ], module: :questions
        resource :moveup, only: [ :create ], module: :questions
        resource :movedown, only: [ :create ], module: :questions
      end
    # end
  end

end
