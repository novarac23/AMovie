Rails.application.routes.draw do
  
  devise_for :users

  authenticated do
    #default/root route if a user is logged in
    root 'movies#index', as: :authenticated
  end

  #default/root route if a user is not logged in
  root 'static_pages#landing'

  # resources :movies do
  #   post '/comments/', to: 'comments#create', as: 'comments'
  # end

  resources :movies do 
    resources :comments
    collection do
      get 'search'
    end
  end

end

