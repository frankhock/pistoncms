# module to share functionality between posts and pages
module Pistoncms
  module Concerns
    module EntryLike
      extend ActiveSupport::Concern

      included do

        before_action :_handle_bulk_actions, only: [:index]
        before_action :_set_media

      end

      private

      def _set_media
        @medias = Pistoncms::Media.order('created_at DESC')
      end

      def _handle_bulk_actions
        handler = Pistoncms::EntryBulkActionHandler.new(params)
        flash.now[:notice] = handler.flash if handler.execute
      end

    end
  end
end