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
    affected = 0
    Pistoncms::Entry.find(entries).each { |e| affected += 1 if e.destroy }

    if affected > 0
      self.flash = "#{pluralize(affected, 'Item')} moved to the Trash."
      return true
    else
      return false
    end
  end

end