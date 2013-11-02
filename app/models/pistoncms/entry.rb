module Pistoncms
  class Entry < ActiveRecord::Base
    self.table_name = 'pistoncms_entries'

    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

    acts_as_paranoid

    BULK_ACTIONS = {trash: 'Move to Trash'}

    #-----------------#
    # - Associations -#
    #-----------------#

    belongs_to :featured_image, class_name: "Pistoncms::Media"

    #-----------------#
    # - Validations - #
    #-----------------#

    validates :title, presence: true, uniqueness: true
    validates :name, uniqueness: true

    #---------------#
    # - Callbacks - #
    #---------------#

    before_validation :_set_name

    #------------#
    # - Scopes - #
    #------------#

    scope :latest, lambda {|*record_limit| order('created_at DESC').limit(record_limit) }

    #
    # Instance Methods
    #

    # determines type of entry with namespace optoins
    #
    # @post.type
    #
    def type(options={})
      namespace = options.fetch(:namespace, true)
      underscore = options.fetch(:underscore, false)

      type = super()
      type = namespace ? type : type.split("::").last
      type = underscore ? type.gsub("::", "_").downcase : type
    end

    private

    def _set_name
      self.name = self.title.squish.parameterize if self.title
    end

  end
end