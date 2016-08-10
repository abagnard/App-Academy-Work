# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: ['APPROVED', 'PENDING', 'DENIED'],
    message: "%{value} is not a valid status"}
  validate :cant_overlap_approved_requests

  def cant_overlap_approved_requests
    if overlapping_approved_requests
      self.errors[:request] << "can't have overlapping dates with another approved request"
    end
  end

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    sd = self.start_date
    ed = self.end_date
    bad_request = CatRentalRequest.where(<<-SQL,self.cat_id,ed,sd)
      cat_rental_requests.cat_id = ? AND
      cat_rental_requests.start_date <= ? AND
      cat_rental_requests.end_date >= ?
    SQL
  end

  def overlapping_approved_requests
    return false unless self.status == 'APPROVED'
    overlapping_requests.each do |request|
      return true if request.status == 'APPROVED'
    end
    false
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED" if self.status == "PENDING"
      self.save
      self.overlapping_requests.each do |request|
        request.status = "DENIED" if request.status = "PENDING"
        request.save
      end
    end
  end

  def deny!
    self.status = "DENIED" if self.status == "PENDING"
    self.save
  end
end
