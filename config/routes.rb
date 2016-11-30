Rails.application.routes.draw do

  resources :products do
    get :selling_dashboard, on: :collection
    get :add_stock, on: :member
    post :stock_product, on: :member
    post :sell, on: :member
  end

  resources :transactions
  resources :products
  resources :categories

  get 'sessions/create'
  get 'sessions/destroy'

  #get '/errors' => 'expression_proxies#error_widget'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  root 'welcome#index'
end
