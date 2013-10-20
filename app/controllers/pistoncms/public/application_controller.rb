class Pistoncms::Public::ApplicationController < Pistoncms::ApplicationController
  layout :_set_layout

  skip_before_action :_authenticate!

  private

  def _set_layout
    "#{Pistoncms::config.public_layout}"
  end

end