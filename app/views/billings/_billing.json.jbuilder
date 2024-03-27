json.extract! billing, :id, :cost, :description, :payment, :mycase_id, :created_at, :updated_at
json.url billing_url(billing, format: :json)
