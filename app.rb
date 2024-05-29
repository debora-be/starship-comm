require 'sinatra'
require 'csv'
require 'json'
require 'date'

set :bind, '0.0.0.0'

def price_adjustment_factor
  # Assuming peak time is at 14:00 hours
  peak_time = 14
  current_time = DateTime.now.hour
  # Calculate distance from peak time
  time_difference = (current_time - peak_time).abs
  # Simulating a bell curve: closer to peak time, higher the price
  # Sometimes the price should be insanely high
  return 1 + rand(0.0..1.0) if rand(1..20) == 5
  return 1 - 0.06 * time_difference
end

# Load inventory data
inventory = CSV.read('inventory.csv', headers: true, header_converters: :symbol)
inventory.map(&:to_hash)

# API key for demonstration
API_KEY = 'demo123'

before do
  pass if request.path_info == '/docs'
  content_type :json
  halt 401, { error: 'Invalid API Key' }.to_json unless params['api_key'] == API_KEY
end

get '/' do
  redirect to('/docs')
end

get '/docs' do
  content_type :html
  erb :index
end

get '/prices' do
  factor = price_adjustment_factor
  adjusted_prices = inventory.map do |item|
    new_item = {
      name: item[:name],
      category: item[:category],
      price: item[:default_price].to_f,
      qty: item[:qty].to_i,
    }

    if item[:category] == 'Footwear'
      new_item[:price] = item[:default_price].to_f # Flat pricing for footwear
    else
      new_item[:price] = (item[:default_price].to_f * factor).round # Adjusted pricing
    end

    new_item
  end

  content_type :json

  # Test of skill.
  sleep rand(0.0..1.0)
  sleep rand(0.0..10.0) if rand(1..10) == 5
  sleep 61 if rand(1..100) == 5
  halt 500, { error: 'Internal Server Error' }.to_json if rand(1..10) == 5
  halt 422, { error: 'Unprocessable Content' }.to_json if rand(1..10) == 5

  adjusted_prices.to_json
end

