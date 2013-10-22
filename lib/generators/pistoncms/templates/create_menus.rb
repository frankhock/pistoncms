class CreatePistoncmsMenus < ActiveRecord::Migration
  def change
    create_table :pistoncms_menus do |t|
      t.string :name
      t.timestamps
      t.datetime :deleted_at
    end
  end
end
