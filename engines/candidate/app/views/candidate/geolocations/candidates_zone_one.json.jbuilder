json.data @candidates do |candidate|

  json.id candidate.id
  json.name candidate.name
  json.cpf candidate.cpf
  json.income candidate.income
  json.total candidate.total
  json.special_dependent_count candidate.special_dependent_count
  json.situation_name candidate.situation_name 
  json.procedural_name candidate.procedural_name
  json.special_condition_id candidate.special_condition_id
  json.address candidate.address
  json.lat  candidate.lat 
  json.lng  candidate.lng
  json.count_dependent candidate.count_dependent
  json.spouse candidate.spouse
  json.project_name candidate.project_name
  json.project_inactive candidate.project_inactive
  json.interaction json.interaction 
end