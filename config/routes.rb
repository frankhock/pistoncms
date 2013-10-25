class RouteConstraint
  def matches?(request)
    Pistoncms::Page.find_by(slug: request.params[:slug]) ? true : false
  end
end

Rails.application.routes.draw do
  scope module: 'pistoncms' do

    # Backend
    scope "/admin" do
      resources :menus
      resources :pages
      resources :posts
    end

    # Notice both page and post use same url
    # Constraint on page enables post route to be called next
    get ':slug' => 'public/pages#show', as: "public_page", constraints: RouteConstraint.new
    get ':slug' => 'public/posts#show', as: "public_post"

    get '*slug' => 'public/entries#show'

  end
end
