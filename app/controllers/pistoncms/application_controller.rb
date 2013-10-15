module Pistoncms
  class ApplicationController < ActionController::Base
    layout 'pistoncms/layouts/application'

    before_action :_authenticate!

    private

    def _authenticate!
       instance_eval &Pistoncms::Config.authenticate_with
    end

  end
end
