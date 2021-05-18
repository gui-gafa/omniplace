class Role < ApplicationRecord
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
