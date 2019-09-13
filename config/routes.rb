Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'items'         =>    'items#index'
  root to: "items#index"
  get 'users/:id'     =>    'users#show'
  get 'users/sign_out'=>    'users#sign_out'
  get 'users/profile' =>    'users#profile'
  get 'users/deliver_address'=> 'users#deliver_address'
  get 'users/card'    =>     'users#card'
  get 'users/email_password' =>  'users#email_password'
  get 'users/identification' =>  'users#identification'
  get 'users/sms_confirmation'=> 'users#sms_confirmation'
end
