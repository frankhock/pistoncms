module Pistoncms
  class PistoncmsController < ApplicationController
    layout 'pistoncms/layouts/application'

    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    before_action :_authenticate!
    before_action :_set_additional_admin_menu_items

    protected

    def render_404
      render file: Rails.root.join("public", "404"), layout: false, status: "404"
    end

    private

    def _authenticate!
       instance_eval &Pistoncms::Config.authenticate_with
    end

    def _set_additional_admin_menu_items
      @additional_admin_menu_items = Pistoncms.config.additional_admin_menu_items
    end

  end
end
