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
  root to: "index#show"

  authenticate :user do
    resource :home, as: :user_root, only: [ :show ]
    resource :history
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
    end
  end

  authenticate :admin do
    authorize_admin( :developer ) do
      resource :datadump, only: [ :show ]
    end
    authorize_admin( :quizmaster ) do
      resource :quizmaster, only: [ :show ]
      resources :quizzes do
        resource :recalculate, only: [ :create ], module: :quizzes
        resource :enqueue, only: [ :create ], module: :quizzes
        resource :dequeue, only: [ :create ], module: :quizzes
      end

      resources :questions, except: [ :index ] do
        resource :test, module: :questions
        resource :moveup, only: [:show], module: :questions
      end
      # resources :answer_forms, only: [ :create ]
      # namespace :answer_forms, as: :answer_form do
      #   resources :inputs, only: [ :edit, :update, :destroy ]
      #   namespace :inputs, as: :input do
      #     get '/:id' => "/answer_forms/inputs#edit"
      #   end
      #   resources :selects, only: [ :edit, :update, :destroy ]
      #   namespace :selects, as: :select do
      #     get '/:id' => "/answer_forms/selects#edit"
      #   end
      #   resources :multiple_choices, only: [ :edit, :update, :destroy ]
      #   namespace :multiple_choices, as: :multiple_choice do
      #     get '/:id' => "/answer_forms/multiple_choices#edit"
      #   end
      # end
    end
  end

  # resources :answer_form_inputs

end
