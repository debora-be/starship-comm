class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :product_id, type: BSON::ObjectId
  field :quantity, type: Integer
  field :total_price, type: Float

  belongs_to :product

  before_create :adjust_inventory

  private

  def adjust_inventory
    product = Product.find(self.product_id)
    if product.stock >= self.quantity
      product.inc(stock: -self.quantity)
    else
      errors.add(:product, "is out of stock")
      throw :abort
    end
  end
end
