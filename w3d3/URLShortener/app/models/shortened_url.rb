require 'securerandom'


class ShortenedUrl < ActiveRecord::Base
  include SecureRandom

  validates :submitter_id, :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    short_url = SecureRandom.urlsafe_base64(16)
    while ShortenedUrl.exists?(:short_url => short_url)
      short_url = SecureRandom.urlsafe_base64(16)
    end
    short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create!({submitter_id: user, long_url: long_url, short_url: self.random_code})
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visitors.where({created_at: 10.minutes.ago..Time.now}).count
  end



end
