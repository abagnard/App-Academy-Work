class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text  :content, null: false
      t.integer :author_id, null: false, index: true
      t.integer :post_id, null: false, index: true
      t.integer :comment_id
      t.timestamps null: false
    end
  end
end
