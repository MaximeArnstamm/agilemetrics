Rails.application.routes.draw do
  root 'pages#home'

  resources :projects, only: [:show] do
    resources :sprints, except: [:show]
    get 'dashboard' => 'sprints#dashboard'
  end
end
