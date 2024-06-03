class PriceLog
  include Mongoid::Document
  include Mongoid::Timestamps
  field :old_price, type: BigDecimal
  field :new_price, type: BigDecimal
  field :changed_at, type: Time
  belongs_to :product_id
end
