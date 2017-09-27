json.extract! company, :id, :name, :logo, :phone, :website, :created_at, :updated_at
json.url company_url(company, format: :json)
