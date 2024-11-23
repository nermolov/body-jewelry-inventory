module JewelryAttributable
  extend ActiveSupport::Concern

  included do
    has_one :jewelry, as: :jewelry_attributes, touch: true
  end
end
