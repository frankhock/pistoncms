module Pistoncms
  class Entry < ActiveRecord::Base

    BULK_ACTIONS = {trash: 'Move to Trash'}

    # Validations
    validates :title, :name, presence: true, uniqueness: true

    # Callbacks
    before_validation :_set_name

    private

    def _set_name
      self.name = self.title.squish.parameterize if self.title
    end

  end
end