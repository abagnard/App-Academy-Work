# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  moderator_id :integer
#

class Sub < ActiveRecord::Base
  validates :title, :moderator_id, presence: true

  belongs_to :moderator, primary_key: :id, foreign_key: :moderator, class_name: :User
  # has_many :posts
  has_many :post_subs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :post_subs, source: :post

end
