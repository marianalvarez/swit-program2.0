json.array!(@sweets) do |sweet|
  json.extract! sweet, :id, :commenter, :article_id
  json.url sweet_url(sweet, format: :json)
end
