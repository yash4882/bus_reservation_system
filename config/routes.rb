Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    collection do
      get :new_login
      post :login
      patch :change_status
      delete :signout
    end
  end
  resources :buses do 
    collection do 
      resources :tickets
    end
  end
  
end
