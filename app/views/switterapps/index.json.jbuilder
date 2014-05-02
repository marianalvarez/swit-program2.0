json.array!(@switterapps) do |switterapp|
  json.extract! switterapp, :id, :username, :password
  json.url switterapp_url(switterapp, format: :json)
end
