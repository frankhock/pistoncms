Rails.application.routes.draw do

  devise_for :admins

  mount Pistoncms::Engine => '/', :as => 'pistoncms'
    
end
