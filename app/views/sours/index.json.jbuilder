json.array!(@sours) do |sour|
  json.extract! sour, :id, :commenter, :article_id
  json.url sour_url(sour, format: :json)
end
