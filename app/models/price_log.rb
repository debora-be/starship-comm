class PriceLog
  include Mongoid::Document
  include Mongoid::Timestamps
  field :old_price, type: Decimal
  field :new_price, type: Decimal
  field :changed_at, type: Time
  belongs_to :product_id
end
