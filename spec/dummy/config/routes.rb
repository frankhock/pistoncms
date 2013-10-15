Rails.application.routes.draw do


  devise_for :admins
  mount Pistoncms::Engine => '/admin', :as => 'pistoncms'
end
