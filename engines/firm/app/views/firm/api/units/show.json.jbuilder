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
  json.cadastre_address do
    json.situation        current_company.cadastre_address(@unit.current_candidate.id).situation_id rescue nil
    json.date             current_company.cadastre_address(@unit.current_candidate.id).created_at.strftime("%d/%m/%Y")  rescue nil    
    json.name             @unit.current_candidate.name  rescue nil    
    json.cpf              @unit.current_candidate.cpf  rescue nil             
    json.cadastre_id      @unit.current_candidate.id  rescue nil             
  end
end
