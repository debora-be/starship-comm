class PriceLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :product_id, type: Integer
  field :old_price, type: Float
  field :new_price, type: Float
  field :changed_at, type: DateTime

  validates :product_id, presence: true
  validates :new_price, presence: true, numericality: { greater_than: 0 }
  validates :old_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :changed_at, presence: true

  belongs_to :product
end
