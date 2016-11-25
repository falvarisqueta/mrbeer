Rails.application.routes.draw do

  resources :transactions
  resources :products
  resources :categories

  resources :products do
    get :add_stock, on: :member
  end

  resources :products do
    collection do
      get :selling_dashboard
    end
  end

  get 'sessions/create'
  get 'sessions/destroy'

  #get '/errors' => 'expression_proxies#error_widget'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  root 'welcome#index'
end
