module Firm
  class EnterpriseCadastre < ActiveRecord::Base
    self.table_name = 'extranet.candidate_enterprise_cadastres'

    belongs_to :cadastre, class_name: "::Candidate::Cadastre"
    belongs_to :enterprise, class_name: "Firm::Enterprise"
    has_many   :enterprise_cadastre_situations, class_name: "Firm::EnterpriseCadastreSituation"

    scope :by_name,  -> (name) {joins(:cadastre).where('candidate_cadastres.name like ?', "#{name}%")}
    scope :by_cpf,           -> (cpf = nil)             { joins(:cadastre).where('candidate_cadastres.cpf = ?', cpf.gsub('.','').gsub('-',''))}
    scope :by_enterprise,    -> (enterprise_id = nil)   { where(enterprise_id: enterprise_id)}
    scope :by_list,          -> (list = nil)           { joins(:cadastre).where('candidate_cadastres.program_id = ?', list)}
    scope :by_step,          -> (step_id = nil)         { where(indication_cadastre_id: prepare_step(step_id))}
    scope :by_inactive,       -> (inactive)            { where(inactive: inactive)}

    scope :prepare_allotment, -> (allotment_id) {
          cadastres = Firm::Cadastre.where(allotment_id: allotment_id).map(&:id)
        }
    scope :prepare_step, -> (step_id) {
      allotments = Firm::Allotment.where(step_id: step_id).map(&:id)
      self.prepare_allotment(allotments)
    }

    scope :by_new, -> (status) {
          if status == "true"
            joins('left join extranet.candidate_enterprise_cadastre_situations on candidate_enterprise_cadastre_situations.enterprise_cadastre_id = candidate_enterprise_cadastres.id')
            .where('candidate_enterprise_cadastre_situations.enterprise_cadastre_id is null')
          else
            joins(:enterprise_cadastre_situations)
            .where('candidate_enterprise_cadastre_situations.id in (?)',
            Firm::EnterpriseCadastreSituation.unscoped
            .select("MAX(candidate_enterprise_cadastre_situations.id)")
            .group(:enterprise_cadastre_id))

          end
    }
    scope :by_date,    -> (date = nil)   { where('candidate_enterprise_cadastres.created_at::date = ?', Date.parse(date))}

    scope :by_situation, -> (situation){
      joins(:enterprise_cadastre_situations)
      .where('candidate_enterprise_cadastre_situations.created_at in (?) and candidate_enterprise_cadastre_situations.enterprise_cadastre_status_id = ?',
              Firm::EnterpriseCadastreSituation.unscoped
              .select("MAX(candidate_enterprise_cadastre_situations.created_at)")
              .group(:enterprise_cadastre_id), situation)



          }

          scope :desactive, -> { where(inactive: true) }

          scope :contemplated, -> (enterprise_id = nil, step_id = nil, allotment_id = nil){
            query = Candidate::View::IndicatedContemplated.per_enterprise(enterprise_id)

            query = query.joins('INNER JOIN extranet.indication_cadastres
                                 ON indication_cadastres.id = indicated_contemplateds.indication_id')
            query = query.joins('INNER JOIN extranet.indication_allotments
                                 ON indication_allotments.id = indication_cadastres.allotment_id')

            query = query.where('indication_allotments.id = ?', allotment_id)  if !allotment_id.nil? && !allotment_id.empty?
            query = query.where('indication_allotments.step_id = ?', step_id)  if !step_id.nil? && !step_id.empty?

            return query
          }

      scope :in_process, -> {
        self.where(inactive: nil).joins('INNER JOIN extranet.general_pontuations AS point
                    ON point.id = candidate_enterprise_cadastres.cadastre_id')
                  .where('point.situation_status_id = 4')
       }


    validates :enterprise_id, presence: true
  end
end
