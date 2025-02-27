Rails.application.routes.draw do
  resources :games
  resources :quotes
  get "home/index", as: :home
  get "dashboard", to: "dashboard#index", as: :user_root
  get "quiz/index", as: :quizzes
  get "quiz/new", as: :new_quiz
  post "quiz/create", as: :create_quiz
  get "quiz/show/:id", to: "quiz#show", as: :show_quiz
  get "quiz/game/:id", to: "quiz#game", as: :game_quiz
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :user, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
