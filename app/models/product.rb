class Product
  include Mongoid::Document

  field :name, type: String
  field :category, type: String
  field :qty, type: Integer
  field :default_price, type: Float
  field :dynamic_price, type: Float

  validates :name, :category, :qty, :default_price, presence: true

  before_save :calculate_dynamic_price

  private

  def calculate_dynamic_price
    self.dynamic_price = default_price
    self.dynamic_price = apply_space_events(dynamic_price)
    self.dynamic_price = adjust_for_rare_items(dynamic_price, category)
  end

  def apply_space_events(price)
    events = [:solar_storm, :full_moon, :none]
    event = events.sample
    case event
    when :solar_storm
      price * (1 + rand(0.02..0.12))
    when :full_moon
      price * (1 - rand(0.03..0.42))
    else
      price
    end
  end

  def adjust_for_rare_items(price, category)
    rare_categories = ['Alien Artifacts', 'Space Crystals']
    if rare_categories.include?(category) && rand(1..50) == 25
      price * 2
    else
      price
    end
  end
end
