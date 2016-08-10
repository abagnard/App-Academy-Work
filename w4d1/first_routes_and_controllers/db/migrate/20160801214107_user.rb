class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, uniqueness: true
      t.timestamps
    end
  end
end
