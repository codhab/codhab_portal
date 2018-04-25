json.situation @enterprise_situation_statuses do |status|
  json.id status.id
  json.name status.name
  json.situation_action_id status.situation_action_id
end
