class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :band_id, null: false
      t.string :live, null: false, default: false
      t.timestamps null: false
    end

    add_index :albums, :band_id, unique: true
  end
end
