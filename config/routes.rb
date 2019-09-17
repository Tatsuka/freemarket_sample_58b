Rails.application.routes.draw do
devise_for :users, skip: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'items'         =>    'items#index'
  root to: "items#index"
  get 'users/:id'     =>    'users#show'
  get 'users/:id/sign_out'=>    'users#sign_out'
  get 'users/:id/profile' =>    'users#profile'
  get 'users/:id/deliver_address'=> 'users#deliver_address'
  get 'users/:id/card'    =>     'users#card'
  get 'users/:id/email_password' =>  'users#email_password'
  get 'users/:id/identification' =>  'users#identification'
  get 'users/:id/sms_confirmation'=> 'users#sms_confirmation'
  get 'users/:id/edit'            =>  'users#edit'

  resources :signup do
      collection do
        get 'step1_start'
        get 'step2_phonenumber'
        get 'step3_address'
        get 'step4_payment'
        get 'step5_done'
      end
    end

  #マイページ
  get     'mypage',                    to: 'mypage/mypage#index', as: :mypage_top
  get     'logout',                    to: 'mypage/logout#index', as: :mypage_logout
  namespace :mypage do
    get   'profile',                 to: 'profile#edit',                  as: :profile
    patch 'profile',                 to: 'profile#update',                 as: :profile_update
    get   'identification',          to: 'identification#edit',           as: :identification
    patch 'identification',          to: 'identification#update',         as: :identification_update
    resources :credit, only: [:index, :new, :create, :destroy]
  end

  #商品関連ページ
  get      'sell',                 to: 'items#new',                      as: :new_item
  post     'sell',                 to: 'items#create',                   as: :create_item
  get      'search',               to: 'items#search',                   as: :search_items
  resources :items, only: [:show, :edit, :update, :destroy]
  resources :category, only: [:index, :show]

  #取引関連
  namespace :transaction do
    resources :buy, only: [:show, :create]
    resources :order_status, only: :show
  end

  devise_scope :user do
    # session
    get     'login',               to: 'users/sessions#new',             as: :new_user_session
    post    'login',               to: 'users/sessions#create',          as: :user_session
    delete  'logout',              to: 'uesrs/sessions#destroy',         as: :destroy_user_session
    # password
    get     'password/reset',      to: 'users/passwords#new',            as: :new_user_password
    get     'password/edit',       to: 'users/passwords#edit',           as: :edit_user_password
    patch   'usres/password',      to: 'users/passwords#update'
    put     'users/password',      to: 'users/passwords#update'
    post    'users/password',      to: 'users/passwords#create'
    #registration
    get     'signup',              to: 'users/registrations#index',      as: :start_user_registration
    get     'signup/registration', to: 'users/registrations#new',        as: :new_user_registration
    patch   'users',               to: 'users/registrations#update',     as: :user_registration
    put     'users',               to: 'users/registrations#update'
    delete  'users',               to: 'users/registrations#destroy'
    post    'signup/registration', to: 'users/registrations#create',     as: :create_user_registration
  end
  
end
