json.extract! price_log, :id, :product_id_id, :old_price, :new_price, :changed_at, :created_at, :updated_at
json.url price_log_url(price_log, format: :json)
