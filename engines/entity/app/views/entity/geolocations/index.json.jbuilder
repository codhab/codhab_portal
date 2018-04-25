json.data @entities do |entity|
 
  json.id           entity.id rescue nil
  json.name         entity.name.mb_chars.upcase rescue nil
  json.fantasy_name entity.fantasy_name.mb_chars.upcase rescue nil
  json.cnpj         entity.cnpj.format_cnpj
  json.city         entity.city.name rescue nil
  json.address      entity.address
  json.cep          entity.cep
  json.situation    entity.current_situation rescue nil
  json.observation  entity.current_observation rescue nil
  json.president    entity.current_president_name.mb_chars.upcase rescue nil
  json.lat  entity.lat
  json.lng  entity.lng
end 