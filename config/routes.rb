Rails.application.routes.draw do

  devise_for :users, skip: :all
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
    get 'items'         =>    'items#index'
    get 'items/product_details' => 'items#product_details'
    root to: "items#index"
    # get 'users/:id'     =>    'users#show'
    # get 'users/:id/sign_out'=>    'users#sign_out'
    # get 'users/:id/profile' =>    'users#profile'
    # get 'users/:id/deliver_address'=> 'users#deliver_address'
    # get 'users/:id/card'    =>     'users#card'
    # get 'users/:id/email_password' =>  'users#email_password'
    # get 'users/:id/identification' =>  'users#identification'
    # get 'users/:id/sms_confirmation'=> 'users#sms_confirmation'
    # get 'users/:id/edit'            =>  'users#edit'
  
  
  
  
  
    #マイページ
    get     'mypage',                to: 'mypage/mypage#index',           as: :mypage_top
    get     'logout',                to: 'mypage/logout#index',           as: :mypage_logout
    namespace :mypage do
      get   'profile',               to: 'profile#edit',                  as: :profile
      patch 'profile',               to: 'profile#update',                as: :profile_update
      get   'identification',        to: 'identification#edit',           as: :identification
      patch 'identification',        to: 'identification#update',         as: :identification_update

      #出品中商品の編集
      namespace :listings do
        get 'listing',               to: 'listing#index',                 as: :listing_of_items_on_sale
        get 'in_progress',           to: 'in_progress#index',             as: :listing_of_items_in_progress
        get 'completed',             to: 'completed#index',               as: :listing_of_items_completed
        get ':id',                   to: 'listing#show',                  as: :show_listing_of_items_on_sale
        get 'edit/:id',              to: 'listing#edit',                  as: :edit_listing_of_items_on_sale
        patch 'listing',             to: 'listing#update',                as: :update_listing_of_items_on_sale
        delete 'listing',            to: 'listing#destroy',               as: :destroy_listing_of_items_on_sale
      end
      resources :credit, only: [:index, :new, :create, :destroy]
    end

  
    #商品関連ページ
    get      'sell',                 to: 'items#new',                     as: :new_item
    post     'sell',                 to: 'items#create',                  as: :create_item
    get      'search',               to: 'items#search',                  as: :search_items
    resources :items, only: [:show, :edit, :update, :destroy]
    resources :category, only: [:index, :show]
  
    #取引関連
    namespace :transaction do
      resources :buy, only: [:show, :create]
      resources :order_status, only: :show
      post 'pay/:id' => 'buy#pay', as: 'pay'
    end
  
    devise_scope :user do
      # session
      get     'login',                    to: 'users/sessions#new',             as: :new_user_session
      post    'login',                    to: 'users/sessions#create',          as: :user_session
      delete  'logout',                   to: 'uesrs/sessions#destroy',         as: :destroy_user_session
      # password
      get     'password/reset',           to: 'users/passwords#new',            as: :new_user_password
      get     'password/edit',            to: 'users/passwords#edit',           as: :edit_user_password
      patch   'usres/password',           to: 'users/passwords#update'
      put     'users/password',           to: 'users/passwords#update'
      post    'users/password',           to: 'users/passwords#create'
  
      # signup
      resources :signup ,only: [:index,:create] do
        collection do
          get 'registration'
          post 'registration' => 'signup#validates_for_registration'
          get 'sms_confirmation' 
          post 'sms_confirmation' => 'signup#validates_for_confirmation'
          get 'address' 
          post 'address' => 'signup#validates_for_address'
          get 'payment'
          post 'payment' => 'signup#validates_for_payment'
          get 'complete'
        end
      end
      # get     'signup',                   to: 'users/signup#new',               as: :start_user_registration
      # get     'signup/registration',      to: 'users/signup#registration',      as: :new_user_registration
      # get     'signup/sms_comfirmation',  to: 'users/signup#confirmation',      as: :new_user_sms_confirmation
      # get     'signup/address',           to: 'users/signup#address',           as: :new_user_address
      # get     'signup/payment',           to: 'users/signup#payment',           as: :new_user_payment
      # get     'signup/complete',          to: 'users/signup#complete',          as: :new_user_registration_complete
      # post    'signup',                   to: 'users/signup#create',            as: :create_user_registration
      # patch   'signup',                   to: 'users/signup#update',            as: :user_registration
    end
    
  end
