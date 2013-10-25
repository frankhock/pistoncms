class Pistoncms::Public::EntriesController < Pistoncms::Public::PistoncmsController

  before_action :_set_entry

  def show
    if @entry.is_a?(Pistoncms::Page)
      redirect_to pistoncms_public_page_url(@entry.slug)
    else
      redirect_to pistoncms_public_post_url(@entry.slug)
    end
  end

  private

  def _set_entry
    @entry = Pistoncms::Entry.find_by!(slug: params[:slug])
  end

end