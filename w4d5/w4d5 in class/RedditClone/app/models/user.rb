# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  validates :username, :session_token, presence:true, uniqueness:true
  validates :password_digest, presence:true
  validates :password, length:{minimum:6, allow_nil:true}

  before_validation :ensure_session_token

  has_many :subs, primary_key: :id, foreign_key: :moderator, class_name: :Sub
  has_many :posts, primary_key: :id, foreign_key: :author_id, class_name: :Post

  attr_reader :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64(32)
  end

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
    return nil if @user.nil?
    return @user if @user.is_password?(password)
    nil
  end

  def is_password?(password)
    pass_dig = self.password_digest
    BCrypt::Password.new(pass_dig).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
