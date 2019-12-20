module Firm
  class Company < ActiveRecord::Base
    self.table_name = 'extranet.project_companies'

    has_many :enterprises
    has_many :enterprise_cadastres, through: :enterprises
    has_many :enterprise_cadastre_situations, through: :enterprise_cadastres
    has_many :cadastres, through: :enterprise_cadastres

    has_many :enterprise_typologies, through: :enterprises
    has_many :units, through: :enterprise_typologies
    has_many :cadastre_addresses, through: :units

    def set_token user
      self.token = Digest::SHA1.hexdigest([Time.now, "#{user.company_id}#{user.id}"].join)
      self.token_expires_in = Time.now + 2.days
    end

    def cadastre cadastre_id
      enterprise_cadastres.where(cadastre_id: cadastre_id)
    end

    def cadastre_address cadastre_id
      cadastre_addresses.where(cadastre_id: cadastre_id).order('created_at ASC').last
    end
    
    def cadastre_address_all
      cadastre_addresses.order('id DESC').first
    end
  end
end
