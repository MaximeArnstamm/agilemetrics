Rails.application.routes.draw do
  resources :projects, only: [:show] do
    resources :sprints, except: [:show]
  end
end
