require 'csv'

namespace :import do
  desc 'Import products from a CSV file'
  task products: :environment do
    file_path = 'db/seeds/inventory.csv'

    CSV.foreach(file_path, headers: true) do |row|
      product = Product.find_or_initialize_by(name: row['NAME'])
      product.update(
        category: row['CATEGORY'],
        default_price: row['DEFAULT_PRICE'].to_f,
        qty: row['QTY'].to_i,
        price: row['DEFAULT_PRICE'].to_f 
      )
    end
    puts 'Products imported successfully!'
  end
end
