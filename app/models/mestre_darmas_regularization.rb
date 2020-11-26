class MestreDarmasRegularization < ApplicationRecord
  self.table_name = 'offboardx.form_mestre_darmas_regularizations'

  belongs_to :civil_state, required: false, class_name: "::Core::Candidate::CivilState"
end
