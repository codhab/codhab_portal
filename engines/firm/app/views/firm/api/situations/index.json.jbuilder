json.data @dropouts do |dropout|
  json.cpf dropout.cadastre.cpf
  json.data_inativacao dropout.inactive_date
end
