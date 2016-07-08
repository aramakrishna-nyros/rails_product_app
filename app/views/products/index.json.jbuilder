json.array!(@products) do |product|
  json.extract! product, :product_id, :title, :price, :quantity, :vat, :totol_price, :image, :description
  json.url product_url(product, format: :json)
end
