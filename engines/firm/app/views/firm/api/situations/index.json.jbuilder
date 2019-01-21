json.data @dropouts do |dropout|
  json.cpf dropout.cadastre.cpf
  json.data_inativacao dropout.inactive_date
  json.enterprise_id dropout.enterprise_id
end
