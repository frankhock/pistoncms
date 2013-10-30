class Pistoncms::MediaController < Pistoncms::PistoncmsController

  def create
    @media  = Pistoncms::Media.create(media_params)
    @medias = Pistoncms::Media.all
  end

  private

  def media_params
    params.require(:media).permit(:file)
  end

end