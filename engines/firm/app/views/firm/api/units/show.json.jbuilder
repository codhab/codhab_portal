json.data do
  json.id @unit.id
  json.control_number @unit.control_number
  json.acron_block @unit.acron_block
  json.block @unit.block
  json.acron_group @unit.acron_group
  json.group @unit.group
  json.unit @unit.unit
  json.complete_address @unit.complete_address
  json.burgh @unit.burgh
  json.city @unit.city.present? ? @unit.city.name : nil
  json.urb @unit.urb
  json.candidate @unit.current_candidate.present? ? @unit.current_candidate.cpf : nil
  json.void @unit.unit_void? ? 'sim' : 'não'
  json.book @unit.unit_book? ? 'sim' : 'não'
  json.occupied @unit.unit_occupied? ? 'sim' : 'não'
end
