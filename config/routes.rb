Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'

  resources :users do
    # collection do
    #   get :new_login
    #   post :login
    #   delete :signout
    # end
    member do 
      get :change_status
      patch :change_status
    end
  end
  resources :buses 
  resources :tickets do
    resources :passengers
    resources :reviews
  end
end

# index
# show
# edit
# update
# cretae
# new
# destroy