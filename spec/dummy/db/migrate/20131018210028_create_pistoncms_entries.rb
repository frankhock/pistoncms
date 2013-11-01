class CreatePistoncmsEntries < ActiveRecord::Migration
  def change
    create_table :pistoncms_entries do |t|
      t.string :type
      t.string :title,      null: false
      t.string :name,       null: false
      t.string :slug
      t.string :content
      t.integer :featured_image_id
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :pistoncms_entries, :slug, unique: true
    add_index :pistoncms_entries, :featured_image_id
  end
end