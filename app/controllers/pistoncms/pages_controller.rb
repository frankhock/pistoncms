class Pistoncms::PagesController < Pistoncms::PistoncmsController
  include Pistoncms::Concerns::EntryLike

  before_action :_set_page

  def index
    @entries = Pistoncms::Page.all
  end

  def new
    @entry = Pistoncms::Page.new
    gon.entry_type = @entry.type(underscore: true)
  end

  def create
    @page = Pistoncms::Page.new(page_params)

    if @page.save
      flash[:success] = "Page published."
      redirect_to edit_pistoncms_page_url(@page)
    else
      render :new
    end
  end

  def edit
    gon.entry_type = @entry.type(underscore: true)
  end

  def update
    if @entry.update_attributes(page_params)
      flash[:notice] = "Page updated."
      redirect_to edit_pistoncms_page_path(@entry)
    else
      render :edit
    end
  end

  private

  def _set_page
    @entry = Pistoncms::Page.friendly.find(params[:id]) if params[:id]
  end

  def page_params
    params.require(:pistoncms_page).permit(:title, :content, :featured_image)
  end

end