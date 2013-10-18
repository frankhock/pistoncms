class CreatePistoncmsTables < ActiveRecord::Migration
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

    create_table :friendly_id_slugs do |t|
      t.string   :slug,           :null => false
      t.integer  :sluggable_id,   :null => false
      t.string   :sluggable_type, :limit => 50
      t.string   :scope
      t.datetime :created_at
    end
    add_index :friendly_id_slugs, :sluggable_id
    add_index :friendly_id_slugs, [:slug, :sluggable_type]
    add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], :unique => true
    add_index :friendly_id_slugs, :sluggable_type
  end
end
