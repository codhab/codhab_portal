json.data @postos do |posto|
  json.id posto.id
  json.name posto.name
  json.city posto.city.name
  json.latitude posto.latitude
  json.longitude posto.longitude
  json.schedule posto.schedule
  json.status posto.status
  json.observation posto.observation
end
