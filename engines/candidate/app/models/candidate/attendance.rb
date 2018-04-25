module Candidate
  class Attendance < ActiveRecord::Base
    self.table_name = "extranet.attendance_cadastres"

    belongs_to :attendant, class_name: "Person::Staff"
    belongs_to :supervisor, class_name: "Person::Staff"
    belongs_to :service_station
    belongs_to :cadastre, class_name: "::Candidate::Cadastre"

    has_many   :activities    
    has_many   :logs    

    has_one    :cadastre_mirror, class_name: "Attendance::Candidate::CadastreMirror", foreign_key: 'id', primary_key: 'cadastre_mirror_id'

    enum situation: ['pendente_com_atendente', 'pendente_com_supervisor', 'finalizado', 'cancelado']
    enum situation_cadastre: ['indeferido', 'deferido']

  end
end