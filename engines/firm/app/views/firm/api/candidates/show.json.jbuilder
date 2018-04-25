json.data do
  json.cadastre do
    json.id                 @candidate.id
    json.name               @candidate.name
    json.cpf                @candidate.cpf
    json.gender             @candidate.gender
    json.born               @candidate.born
    json.born_uf            @candidate.born_uf
    json.rg                 @candidate.rg
    json.rg_org             @candidate.rg_org
    json.telephone          @candidate.telephone
    json.telephone_optional @candidate.telephone_optional
    json.celphone           @candidate.celphone
    json.email              @candidate.email
    json.address            @candidate.address
    json.city               @candidate.city.name rescue nil
    json.uf                 @candidate.city.state.acronym rescue nil
    json.cep                @candidate.cep
    json.special_condition  @candidate.special_condition.name rescue nil
    json.list               @candidate.program.name
    json.income             @candidate.main_income
    json.situation          @candidate.current_situation_name
    json.procedural         @candidate.current_procedural_name
  end

  json.dependents @candidate.dependents do |dependent|
    json.name        dependent.name
    json.cpf         dependent.cpf
    json.born        dependent.born
    json.income      dependent.income
    json.kinship     dependent.kinship.name rescue nil
  end

  json.pontuations @candidate.pontuations.order('created_at DESC') do |pontuation|
    json.total pontuation.total
    json.date  pontuation.created_at.strftime("%Y-%m-%d")
  end

  json.indication current_company.cadastre(@candidate.id) do |indication|
    json.id             indication.id
    json.date           indication.created_at.strftime("%Y-%m-%d")
    json.inactive       indication.inactive
    json.inactive_date  indication.inactive_date

    json.situation indication.enterprise_cadastre_situations.order('created_at ASC') do |situation|
      json.id          situation.id
      json.status      situation.enterprise_situation_status.name
      json.observation situation.observation
      json.date        situation.created_at
    end

  end

  json.address do
    json.unit_id          current_company.cadastre_address(@candidate.id).id rescue nil
    json.control_number   current_company.cadastre_address(@candidate.id).unit.control_number rescue nil
    json.complete_address current_company.cadastre_address(@candidate.id).unit.complete_address rescue nil
    json.city             current_company.cadastre_address(@candidate.id).unit.city.name rescue nil
    json.situation        current_company.cadastre_address(@candidate.id).situation_id rescue nil
    json.date             current_company.cadastre_address(@candidate.id).created_at  rescue nil
  end
end
