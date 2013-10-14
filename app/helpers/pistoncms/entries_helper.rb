module Pistoncms
  module EntriesHelper

    def entry_bulk_actions_array
      array = []
      array.tap do
        array << ["Bulk Action", ""]
        Pistoncms::Entry::BULK_ACTIONS.each do |k, v|
          array << [v, k]
        end
      end
    end

  end
end