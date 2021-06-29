Rails.application.routes.draw do
  get "signup" => 'signup#signup'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "login" => "login#login"
end
