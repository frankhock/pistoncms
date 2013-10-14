class Pistoncms::EntryBulkActionHandler
  include ActionView::Helpers::TextHelper

  attr_reader :params, :action, :entries
  attr_accessor :flash

  def initialize(params)
    @params   = params
    @action   = params.fetch(:bulk_action, "")
    @entries  = params.fetch(:entry, {})
  end

  def execute
    case action
    when "trash"
      delete_all
    else
      false
    end
  end

  private

  def delete_all
    affected = Pistoncms::Entry.delete_all(["id in (?)", entries])

    if affected > 0
      self.flash = "#{pluralize(affected, 'Item')} moved to the Trash."
      return true
    else
      return false
    end
  end

end