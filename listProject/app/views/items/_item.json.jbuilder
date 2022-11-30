json.extract! item, :id, :list_id, :title, :important, :deadline, :created_at, :updated_at
json.url item_url(item, format: :json)
