class AddSlugToPistoncmsEntries < ActiveRecord::Migration
  def change
    add_column :pistoncms_entries, :slug, :string
    add_index :pistoncms_entries, :slug, unique: true
  end
end
