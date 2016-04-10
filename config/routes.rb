Rails.application.routes.draw do
  namespace :admin do
    resources :projects

    root to: "projects#index"
  end

  root 'pages#home'

  resources :projects, only: [:show] do
    resources :sprints, except: [:show]
    get 'dashboard' => 'sprints#dashboard'
  end
end
