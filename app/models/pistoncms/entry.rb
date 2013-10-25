module Pistoncms
  class Entry < ActiveRecord::Base
    self.table_name = 'pistoncms_entries'

    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

    acts_as_paranoid

    BULK_ACTIONS = {trash: 'Move to Trash'}

    # Validations
    validates :title, presence: true, uniqueness: true
    validates :name, uniqueness: true

    # Callbacks
    before_validation :_set_name

    #
    # Instance Methods
    #

    def type(options={})
      namespace = options.fetch(:namespace, true)
      type = super()
      namespace ? type : type.split("::").last
    end

    private

    def _set_name
      self.name = self.title.squish.parameterize if self.title
    end

  end
end