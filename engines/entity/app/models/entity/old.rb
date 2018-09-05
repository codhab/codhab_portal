module Entity
  class Old < ActiveRecord::Base
    self.table_name = 'extranet.entity_olds'

    enum old_type: ['credenciada', 'não_credenciada','descredenciada']
    
    belongs_to :new_city, class_name: "Core::Address::City", foreign_key: :city_id
    
      validates_presence_of :name,:telephone, :email, :president_name,:president_cpf, :password, :address, :city_id, :cep, :fantasy_name
      validates :president_cpf, cpf:true
      validates_confirmation_of :password 

    scope :by_name, -> (value) {
      where("name ILIKE '%#{value}%'")
    }

    scope :by_cnpj, -> (value) {
      where(cnpj: value.unformat_cnpj)
    }

    scope :by_situation, -> (value) {
      where(old: value)
    }

    def current_situation
      self.old.mb_chars.upcase
    end

    def current_president_name
      self.president_name
    end
  end
end