Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'register' => "registrations#create" # when user enters user info it will post to the database.

  get 'check_user' => 'registrations#check_user'

  get 'login' => "registrations#login" # When user logs in to website they are redirected to the welcome page.

  get 'confirmation' => "registrations#confirmation" # When user enters registration information user gets redirected to confirmation page.

  root 'registrations#index' # Sets homepage
end
