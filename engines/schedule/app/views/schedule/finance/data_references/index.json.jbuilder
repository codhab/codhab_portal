json.addresses @address do |address|
  json.id address.id
  json.city_agenda_id address.city_agenda_id
  json.address_agenda address.address_agenda
  json.block address.block
  json.code address.code
end

json.blocks @address.order('block ASC').uniq.pluck(:block) do |unit|
  json.value unit
end

json.address_agenda @address.order('address_agenda ASC').select(:address_agenda) do |unit|
  json.address unit
end
