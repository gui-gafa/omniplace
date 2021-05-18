json.extract! expense, :id, :value, :frequency, :description, :user_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
