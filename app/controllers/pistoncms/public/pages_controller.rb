class Pistoncms::Public::PagesController < Pistoncms::Public::ApplicationController 

  before_action :_set_page

  def show

  end

  private

  def _set_page
    @page = Pistoncms::Page.find_by!(slug: params[:slug])
  end

end