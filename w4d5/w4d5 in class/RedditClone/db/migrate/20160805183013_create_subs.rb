class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.integer :moderator, null: false, index: true
      t.string :title, null: false, unique: true
      t.text :description

      t.timestamps null: false
    end
  end
end
