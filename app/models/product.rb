class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :category, type: String
  field :default_price, type: Float
  field :qty, type: Integer
  field :price, type: Float
  field :demand, type: Float
  field :stock, type: Integer
  field :competitor_price, type: Float

  has_many :orders
  has_many :price_logs

  validates :name, :category, :qty, :price, presence: true

  def dynamic_price
    self.price + (self.demand * 0.1) - (self.stock * 0.05) + (self.competitor_price || 0)
  end
end
