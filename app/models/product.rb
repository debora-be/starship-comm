class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :description, type: String
  field :price, type: Decimal
  field :stock, type: Integer
  field :demand, type: Integer
  field :competitor_price, type: Decimal
  field :created_at, type: Time
  field :updated_at, type: Time
end
