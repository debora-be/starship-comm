require 'csv'

class ImportProducts
  def self.from_csv(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      Product.create!(
        name: row[:name],
        category: row[:category],
        qty: row[:qty].to_i,
        default_price: row[:default_price].to_f
      )
    end
  end
end
