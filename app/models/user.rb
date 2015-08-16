class User < ActiveRecord::Base
  has_secure_password
  has_many :groups
  has_many :members
  has_many :groups_joined, through: :members, source: :group
  has_many :posts
  has_many :comments

  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 7 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
