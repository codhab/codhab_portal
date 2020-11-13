module Address
  class Unit < ActiveRecord::Base
    self.table_name = 'extranet.address_units'

    belongs_to :situation_unit, class_name: "Address::SituationUnit"
    belongs_to :ownership_type, class_name: "Address::OwnershipType"
    belongs_to :enterprise_typology, class_name: "Firm::EnterpriseTypology", foreign_key: 'enterprise_typology_id'
    belongs_to :city, class_name: "Address::City"
    belongs_to :type_use_unit, class_name: "Address::TypeUseUnit"
    has_many :registry_units, class_name: "Address::RegistryUnit"
    has_many :cadastre_address, class_name: "Candidate::CadastreAddress"

    has_one :notary_office, class_name: "Address::NotaryOffice"

    scope :address, -> (address) {where("complete_address ILIKE ?", "%#{address}%")}
    scope :status, -> (status) {where(situation_unit_id: status)}
    scope :by_cpf, -> (cpf) {
    joins(cadastre_address: :cadastre)
    .where('candidate_cadastre_addresses.created_at in (?)',
            Candidate::CadastreAddress.unscoped
            .select("MAX(candidate_cadastre_addresses.created_at)")
            .group(:unit_id))
    .where("candidate_cadastre_addresses.situation_id in (0,1,5) and candidate_cadastres.cpf = ?", cpf.unformat_cpf)
    }
    scope :by_typology, -> (typology) {joins(:enterprise_typology).where('extranet.project_enterprise_typologies.id = ?', typology)}
    scope :by_enterprise, -> (enterprise) {joins(:enterprise_typology).where('extranet.project_enterprise_typologies.enterprise_id = ?', enterprise)}



    def unit_void?
      self.situation_unit_id == 1 && (current_cadastre_address.nil? || current_cadastre_address.distrato?)
    end

    def current_registry_id
     registry_units.order('id ASC').last.situation rescue I18n.t(:no_information)
    end

    def unit_book?
      self.situation_unit_id == 6 && current_cadastre_address.present? && current_cadastre_address.reserva?
    end

    def unit_occupied?
      [2,3,5,6,9,10,12].include? self.situation_unit_id
    end

    def current_candidate
      address = self.cadastre_address.order('created_at asc').last rescue nil

      return false if address.nil?
      return false unless %w(reserva distribuído sobrestado).include?(address.situation_id)

      cadastre = address.cadastre rescue nil

    end

    def current_cadastre_address
      self.cadastre_address.order('created_at ASC').last rescue nil
    end

  end
end
