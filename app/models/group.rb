class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :users, through: :members, source: :user
  has_many :posts

  validates :description, presence: true
  validates :name, presence: true, length: { minimum: 5 }
  validates :description, length: { minimum: 10 }
end
