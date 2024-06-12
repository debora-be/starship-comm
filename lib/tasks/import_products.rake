# lib/tasks/import_products.rake

namespace :import do
  desc "Import products from CSV"
  task products: :environment do
    require 'csv'

    csv_file_path = Rails.root.join('db', 'seeds', 'inventory.csv')
    
    unless File.exist?(csv_file_path)
      puts "CSV file not found: #{csv_file_path}"
      exit
    end

    CSV.foreach(csv_file_path, headers: true) do |row|
      product = Product.find_or_initialize_by(name: row['NAME'])
      product.update!(
        category: row['CATEGORY'],
        qty: row['QTY'],
        price: row['DEFAULT_PRICE']
      )
    end

    puts "Products imported successfully"
  end
end
