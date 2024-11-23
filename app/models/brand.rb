class Brand < ApplicationRecord
  has_many :jewelry, dependent: :destroy
end
