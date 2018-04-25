json.info do 
  json.total @units.count
end

json.data @units do |unit|
  json.id                 unit.id
  json.control_number     unit.control_number
  json.complete_address   unit.complete_address
  json.cep                unit.cep_unit
  json.registration_iptu  unit.registration_iptu
  json.area               unit.area
  json.enterprise         unit.enterprise_typology.enterprise.name rescue nil
  json.typology           unit.enterprise_typology.description rescue nil
end