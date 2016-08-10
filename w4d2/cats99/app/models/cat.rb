require 'date'

# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date
#  color       :string
#  name        :string           not null
#  sex         :string(1)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  ALL_COLORS = ["Black","White", "Brown"]
  validates :name, presence: true
  validates :color, inclusion: { in: ALL_COLORS,
    message: "%{value} is not a valid color" }
  validates :sex, inclusion: {in: ['M', 'F'],
    message: "%{value} is not a valid sex"}

  def age
    birthday = self.birth_date
    age = Date.today.year - birthday.year
    age -= 1 if Date.today < birthday + age.years
    age
  end

  def male?
    self.sex == "M"
  end

  has_many :requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    :dependent => :destroy
end
