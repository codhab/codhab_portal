module Firm
  class EnterpriseCadastreSituation < ActiveRecord::Base
    self.table_name = 'extranet.candidate_enterprise_cadastre_situations'

    default_scope { order('created_at DESC')}

    belongs_to :enterprise_situation_status, class_name: "Firm::EnterpriseSituationStatus", foreign_key: "enterprise_cadastre_status_id"
    belongs_to :enterprise_cadastre, class_name: "Firm::EnterpriseCadastre"
    belongs_to :enterprise_situation_action, class_name: "Firm::EnterpriseSituationAction", foreign_key: "enterprise_situation_action_id"

    enum type_action: ['contato', 'informação', 'devolução', 'documental']

    mount_uploader :file_path, Firm::FilePathUploader

    validates :enterprise_situation_status, :observation, presence: true

    scope :type_action, -> (type_action) {
      enum_id = self.type_actions[type_action]
      ::Firm::EnterpriseSituationStatus.where(situation_action_id: enum_id)
    }
  end
end
