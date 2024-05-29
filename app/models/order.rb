class Order
    include Mongoid::Document
  
    field :product_id, type: BSON::ObjectId
    field :qty, type: Integer
    field :price_per_item, type: Float
    field :total_price, type: Float
  
    belongs_to :product
  
    before_create :calculate_total_price, :update_product_inventory
  
    private
  
    def calculate_total_price
      self.total_price = qty * price_per_item
    end
  
    def update_product_inventory
      product = Product.find(product_id)
      if product.qty < qty
        errors.add(:qty, "Not enough inventory")
        throw(:abort)
      else
        product.update(qty: product.qty - qty)
      end
    end
  end
  