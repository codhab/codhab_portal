json.array! @json_data do |data|
  json.remessa data[:remessa]
  json.arquivo data[:arquivo]
end