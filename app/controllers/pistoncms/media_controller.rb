class Pistoncms::MediaController < Pistoncms::PistoncmsController

  def create
    @media = Pistoncms::Media.create(media_params)
  end

  private

  def media_params
    params.require(:media).permit(:file)
  end

end