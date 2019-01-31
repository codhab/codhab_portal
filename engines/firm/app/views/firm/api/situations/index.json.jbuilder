json.data @dropouts do |dropout|
  json.cpf dropout.cadastre.cpf
  json.data_inativacao dropout.inactive_date
  json.enterprise_id dropout.enterprise_id
  json.accepted_date dropout.accepted_date
  json.accepted dropout.accepted
end
