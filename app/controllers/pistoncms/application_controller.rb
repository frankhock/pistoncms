module Pistoncms
  class ApplicationController < ActionController::Base
    layout 'pistoncms/layouts/application'

    rescue_from ActiveRecord::RecordNotFound, with: :render_404  

    before_action :_authenticate!

    protected

    def render_404
      render file: Rails.root.join("public", "404"), layout: false, status: "404"
    end

    private

    def _authenticate!
       instance_eval &Pistoncms::Config.authenticate_with
    end

  end
end
