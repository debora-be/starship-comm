class PriceLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :product_id, type: BSON::ObjectId
  field :old_price, type: Float
  field :new_price, type: Float
  field :changed_at, type: DateTime

  belongs_to :product
end
