json.extract! loan, :id, :value, :date, :taker_id, :provider_id, :created_at, :updated_at
json.url loan_url(loan, format: :json)
