class Pistoncms::MenusController < Pistoncms::ApplicationController 

  def index
    @menus = Pistoncms::Menu.all
  end

end