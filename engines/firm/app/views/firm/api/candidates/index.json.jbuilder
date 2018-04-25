json.info do 
  json.total @indications.count
end

json.data @indications do |indication|
  json.id                        indication.id
  json.name                      indication.cadastre.name rescue 'Sem informação'
  json.cpf                       indication.cadastre.cpf rescue 'Sem informação'
  json.indication_date           indication.created_at.strftime("%Y-%m-%d")
  json.indication_inactive       indication.inactive 
  json.indication_inactive_date  indication.inactive_date 
  json.enterprise                indication.enterprise.name
end