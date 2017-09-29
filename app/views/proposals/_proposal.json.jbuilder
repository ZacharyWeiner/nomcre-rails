json.extract! proposal, :id, :title, :content, :deadline, :price, :accepted, :company_id, :proposal_type, :completed, :completed_on, :paid, :charge_id, :bts, :focus_points, :time_of_day, :location, :background, :created_at, :updated_at
json.url proposal_url(proposal, format: :json)
