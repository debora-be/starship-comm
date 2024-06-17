class UpdatePricesJob
  include Sidekiq::Worker

  def perform
    Product.all.each do |product|
      competitor_price = fetch_competitor_price(product)
      old_price = product.price
      product.update(
        price: product.dynamic_price,
        competitor_price: competitor_price
      )
      PriceLog.create!(
        product: product,
        old_price: old_price,
        new_price: product.price,
        changed_at: Time.now
      )
    end
  end

  private

  def fetch_competitor_price(product)
    response = Faraday.get("https://sinatra-pricing-api.fly.dev/products/#{product.id}")
    JSON.parse(response.body)["price"]
  rescue
    nil
  end
end
