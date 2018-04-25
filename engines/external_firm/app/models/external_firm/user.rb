require_dependency 'external_firm/application_record'

module ExternalFirm
  class User < ApplicationRecord
    self.table_name = 'extranet.external_firm_users'

    has_many :cadastres
  end
end
