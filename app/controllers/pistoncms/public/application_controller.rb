class Pistoncms::Public::ApplicationController < Pistoncms::ApplicationController

  skip_before_action :_authenticate!

end