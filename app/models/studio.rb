class Studio < ApplicationRecord
  has_many :jewelry, dependent: :destroy

  # validations
  validates :name, presence: true
end
