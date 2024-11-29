Rails.application.routes.draw do
  resources :students do
    collection do
      post :import
      get :stats
      get :search
      get :filter
    end
  end

  resource :import, only: %i[show create]

  root 'dashboards#index'
end
