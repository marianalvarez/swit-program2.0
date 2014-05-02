json.array!(@welcoms) do |welcom|
  json.extract! welcom, :id, :username, :password
  json.url welcom_url(welcom, format: :json)
end
