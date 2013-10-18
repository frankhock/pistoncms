class CreatePistoncmsEntries < ActiveRecord::Migration
  def change
    create_table :pistoncms_entries do |t|
      t.string :type
      t.string :title,      null: false
      t.string :name,       null: false
      t.string :slug
      t.string :content
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :pistoncms_entries, :slug, unique: true
  end
end