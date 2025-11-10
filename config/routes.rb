Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "top#index"

  get "member/profile/:member_id" => "member#profile"
end
