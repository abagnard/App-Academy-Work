class EditColName < ActiveRecord::Migration
  def change
    remove_column :subs, :moderator
    add_column :subs, :moderator_id, :integer, index: true
  end
end
