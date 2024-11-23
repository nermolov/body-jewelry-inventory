class Jewelry < ApplicationRecord
  belongs_to :brand
  belongs_to :studio
  belongs_to :location
  belongs_to :material
  delegated_type :jewelry_attributes, types: %w[
      AttributesCaptiveBeadRing
      AttributesChain
      AttributesCircularBarbell
      AttributesCurvedBarbell
      AttributesLabretPost
      AttributesPlug
      AttributesThreadedEnd
      AttributesThreadlessEnd
    ], dependent: :destroy
end
