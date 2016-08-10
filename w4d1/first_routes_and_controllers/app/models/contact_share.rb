# create_table "contact_shares", force: :cascade do |t|
#   t.integer  "contact_id", null: false
#   t.integer  "user_id",    null: false
#   t.datetime "created_at"
#   t.datetime "updated_at"

class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :user_id, uniqueness: {scope: :contact_id}

  belongs_to :contact,
  primary_key: :id,
  foreign_key: :contact_id,
  class_name: :Contact

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

end
