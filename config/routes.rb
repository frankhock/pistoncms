Pistoncms::Engine.routes.draw do

  # Backend
  scope "/admin" do
    resources :pages
    resources :posts
  end

  match ':post_slug' => 'public/posts#show', as: "public_post", via: [:get]
  match ':page_slug' => 'public/pages#show', as: "public_page", via: [:get]

  match '*slug' => 'public/entries#show', via: [:get]

end
