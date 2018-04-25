require_dependency 'external_firm/application_record'
module ExternalFirm
  class Cadastre < ApplicationRecord
    self.table_name = 'extranet.external_firm_cadastres'

    belongs_to :user
    belongs_to :city, class_name: "::Address::City", foreign_key: 'city_id'

    validates :name, :cpf, :rg, :address, :telephone, cpf: true, presence: true
  end
end
