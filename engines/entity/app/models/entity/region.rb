module Entity
  class Region < ActiveRecord::Base
    self.table_name = 'extranet.entity_regions'

    has_many :cities, class_name: "::Address::City", foreign_key: 'entity_region_id'

    def cadastres
      ::Entity::Cadastre.where(city_id: self.cities.map(&:id))
    end

  end
end