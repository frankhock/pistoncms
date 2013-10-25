class Pistoncms::Public::PistoncmsController < Pistoncms::PistoncmsController
  layout :_set_layout

  skip_before_action :_authenticate!

  private

  def _set_layout
    "#{Pistoncms::config.public_layout}"
  end

end