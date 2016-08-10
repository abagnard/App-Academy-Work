# == Schema Information
#
# Table name: contacts
#
#  id       :integer          not null, primary key
#  name     :string           not null
#  email    :string           not null
#  owner_id :integer          not null
#

class Contact < ActiveRecord::Base
  validates :name, :email, :owner_id, presence: true
  validates :email, uniqueness: {scope: :owner_id}

  belongs_to :user,
  primary_key: :id,
  foreign_key: :owner_id,
  class_name: :User

  has_many :contact_shares,
  primary_key: :id,
  foreign_key: :contact_id,
  class_name: :ContactShare

  has_many :shared_users,
  through: :contact_shares,
  source: :user

end
