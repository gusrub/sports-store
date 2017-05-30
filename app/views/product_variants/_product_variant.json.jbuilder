json.extract! product_variant, :id, :product_id, :size_id, :color_id, :stock, :sku, :price, :discount, :created_at, :updated_at
json.url product_variant_url(product_variant, format: :json)
