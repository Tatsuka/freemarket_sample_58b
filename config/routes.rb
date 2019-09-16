Rails.application.routes.draw do
  devise_for :users
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
end
