json.extract! product, :id, :name, :category, :description, :type, :url, :created_at, :updated_at
json.url product_url(product, format: :json)
