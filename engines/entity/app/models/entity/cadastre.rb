module Entity
  class Cadastre < ActiveRecord::Base
    self.table_name = 'extranet.entity_cadastres'


    attr_accessor :cadastre_type

    enum cadastre_type: ['recadastramento']

    belongs_to :city, class_name: "Address::City"

    has_many :situations
    has_many :members
    has_many :candidates

    scope :by_region, -> (value) {
      cities = ::Address::City.where(entity_region_id: value).map(&:id) 
      where(city_id: cities)
    }

    scope :by_name, -> (value) {
      where("name ILIKE '%#{value}%'")
    }
    
    scope :by_acron, -> (value) {
      where("fantasy_name ILIKE '%#{value}%'")
    }
    
    scope :by_cnpj, -> (value) {
      result = where(cnpj: value.unformat_cnpj)

      if !result.present?
        result_old = Entity::Old.where(cnpj: value.unformat_cnpj)
        
        if !result_old.present?
          result
        else 
          result_old
        end
      else 
        result
      end
    }   
    mount_uploader :archive_path, Wiki::FileUploader


    scope :by_city, -> (value) { where(city_id: value) }
    scope :by_situation, ->(value) {

      joins(:situations)
      .where("(extranet.entity_situations.id IN (SELECT MAX(entity_situations.id) as max
              FROM extranet.entity_situations GROUP BY extranet.entity_situations.cadastre_id))")
      .where('extranet.entity_situations.situation_status_id = ?', value)

    }

    def password; "[FILTRED]"; end;
    def reset_token; "[FILTRED]"; end;

    def current_president_name
      self.members.where(member_job_id: 2).first.name rescue nil
    end
    def current_president_photo
      self.members.where(member_job_id: 2).first.photo rescue nil
    end
    def current_vice_president_name
      self.members.where(member_job_id: 3).first.name rescue nil
    end
    
    def current_directors_name
      self.members.where(member_job_id: 5) rescue nil
    end
    
    def current_situation
      self.situations.order(:id).last.situation_status.name.mb_chars.upcase rescue I18n.t(:no_information)
    end

    def current_observation
      current_situation.observation rescue nil
    end

  end
end