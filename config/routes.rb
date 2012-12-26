TsiShedule::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  match '/login' => 'login#index'

  match '/schedule' => 'schedule#index'
  match '/schedule/:period' => 'schedule#show'

  root :to => 'login#index'

end
