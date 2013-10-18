Pistoncms::Engine.routes.draw do

  # Backend
  scope "/admin" do
    resources :pages
    resources :posts
  end

  match ':page_slug' => 'public/pages#show', as: "public_page", via: [:get]

  match '*slug' => 'public/entries#show', via: [:get]

end
