namespace :import do
    desc "Import products from CSV"
    task products: :environment do
      require 'csv'
  
      csv_file_path = 'path/to/your/csvfile.csv'
      CSV.foreach(csv_file_path, headers: true) do |row|
        Product.create(
          name: row['name'],
          description: row['description'],
          price: row['price'],
          stock: row['stock']
        )
      end
    end
  end
  