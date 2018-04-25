module Entity
  class Old < ActiveRecord::Base
    self.table_name = 'extranet.entity_olds'

    attr_accessor :old_type

    enum old_type: ['credenciada', 'não_credenciada','descredenciada']
    
    belongs_to :city, class_name: "Address::City"
    

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