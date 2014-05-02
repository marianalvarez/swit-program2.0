json.array!(@switters) do |switter|
  json.extract! switter, :id, :username, :password
  json.url switter_url(switter, format: :json)
end
