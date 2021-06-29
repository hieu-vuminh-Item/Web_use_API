Rails.application.routes.draw do
  get 'info' => 'info#info'
  get "signup" => 'signup#signup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "login" => "login#login"
  post "session" => "login#create_session"
  post "check_update" => "edit#check_update"
  post "info/logout"
  get "info/logout"
  post "edit" => "edit#edit"
  get "edit" => "edit#edit_get"
end
