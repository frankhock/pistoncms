class CreatePistoncmsMedia < ActiveRecord::Migration
  def change
    create_table :pistoncms_media do |t|
      t.string :title
      t.string :file
      t.text :caption
      t.string :alt_text
      t.text :description
      t.timestamps
    end
  end
end
