json.extract! person, :id, :project_id, :name, :email, :score, :created_at, :updated_at
json.url person_url(person, format: :json)
