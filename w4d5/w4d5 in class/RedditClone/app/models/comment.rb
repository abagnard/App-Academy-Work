# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  author_id  :integer          not null
#  post_id    :integer          not null
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :content, :author_id, :post_id, presence: true

  belongs_to :post
  belongs_to :author, primary_key: :id, foreign_key: :author_id, class_name: :User
  belongs_to :parent, primary_key: :id, foreign_key: :comment_id, class_name: :Comment
  has_many :children, primary_key: :id, foreign_key: :comment_id, class_name: :Comment
end
