class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :price, type: Float
  field :category, type: String
  field :qty, type: Integer
  field :stock, type: Integer
  field :demand, type: Integer, default: 0
  field :competitor_price, type: Float

  has_many :orders
  has_many :price_logs

  validates :name, :category, :qty, :price, presence: true

  def dynamic_price
    # Implement your dynamic pricing logic here
    self.price + (self.demand * 0.1) - (self.stock * 0.05) + (self.competitor_price || 0)
  end
end
