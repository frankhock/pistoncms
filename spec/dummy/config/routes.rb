Rails.application.routes.draw do

  scope :admin do
    resources :books
  end

  devise_for :admins

end
