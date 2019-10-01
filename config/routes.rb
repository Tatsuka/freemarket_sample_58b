Rails.application.routes.draw do

  devise_for :users, skip: :all
  
    get 'items'         =>    'items#index'
    get 'items/product_details' => 'items#product_details'
    root to: "items#index"
  
  
  
  
  
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
    namespace :trade do
      resources :buy, only: [:show, :create]
      resources :order_status, only: :show
      post 'pay/:id' => 'buy#pay', as: 'pay'
    end
  
    devise_scope :user do
      # session
      get     'login',                    to: 'devise/sessions#new',             as: :new_user_session
      post    'login',                    to: 'devise/sessions#create',          as: :user_session
      delete  'logout',                   to: 'devise/sessions#destroy',         as: :destroy_user_session
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
    end
    
  end
