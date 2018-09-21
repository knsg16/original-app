Rails.application.routes.draw do
  root to: "top#index"
  resources :items,       only: [:index, :new, :create, :destroy, :edit, :update]
  resources :companies,   only: [:index, :new, :create, :destroy, :edit, :update]
  resources :plans,       only: [:index, :new, :create, :destroy, :edit, :update]
  resources :pages,       only: [:show, :index, :edit, :update]
  
  resources :deliveries do
    member { get 'maintenanced' }
  end
  resources :contracts do
    member { get 'cancel' }
  end
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  get "users/index" => "users#index"
  resources :users, only: [:edit, :update]
  
  #RSpecのテストをする用
  authenticated do
    root to: "secret#index", as: :authenticated_root
  end
  
  
end
