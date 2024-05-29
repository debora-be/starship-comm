class UpdatePricesJob
    include Sidekiq::Job
  
    def perform
      Product.all.each(&:save)
    end
  end
  