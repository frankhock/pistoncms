Pistoncms::Engine.routes.draw do

  # Backend
  scope "/admin" do
    resources :pages
    resources :posts
  end

  match '*path' => 'pistoncms/public/entries#show'

end
