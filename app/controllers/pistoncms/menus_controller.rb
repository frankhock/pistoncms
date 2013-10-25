class Pistoncms::MenusController < Pistoncms::PistoncmsController

  def index
    @menus = Pistoncms::Menu.all
  end

end