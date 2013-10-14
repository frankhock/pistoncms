class AddDeletedAtToPistoncmsEntries < ActiveRecord::Migration
  def change
    add_column :pistoncms_entries, :deleted_at, :datetime
  end
end
