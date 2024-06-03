class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  field :quantity, type: Integer
  field :total_price, type: BigDecimal
  field :created_at, type: Time
  belongs_to :product_id
end
