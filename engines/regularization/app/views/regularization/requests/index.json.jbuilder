json.data @units.select('id, burgh, block, "group", unit') do |unit|
  json.id unit.id
  json.burgh unit.burgh
  json.block unit.block
  json.group unit.group
  json.unit unit.unit
end

json.burghs @units.order('burgh ASC').uniq.pluck(:burgh) do |unit|
  json.value unit
end

json.blocks @units.order('block ASC').uniq.pluck(:block) do |unit|
  json.value unit
end

json.groups @units.select(:group).distinct.order('"group" ASC') do |unit|
  json.value unit
end

json.units @units.select(:id, :unit).distinct.order('unit ASC') do |unit|
  json.value unit
end
