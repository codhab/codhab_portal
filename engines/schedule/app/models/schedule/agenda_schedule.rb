module Schedule
  class AgendaSchedule < ActiveRecord::Base
    self.table_name = "extranet.schedule_agenda_schedules"
    attr_accessor :block

    scope :by_date,   -> (date) {
      date = Date.parse(date) rescue Date.today
      where(date: date)
    }

    scope :by_status, -> (status) {where(status: status)}
    scope :by_cpf,    -> (cpf) {where(cpf: cpf.to_s.unformat_cpf)}
    scope :by_cnpj,   -> (cnpj) {where(cnpj: cnpj)}
    scope :by_hour,   -> (hour) {where(hour: hour)}
    scope :by_name,   -> (name) {where("name ILIKE '%#{name}%'")}

    scope :by_schedule,   -> (id) {where(agenda_id: id)}

    belongs_to :city, class_name: "Address::City"
    belongs_to :city_agenda, class_name: "Address::City", foreign_key: 'city_agenda_id'
    belongs_to :agenda

    enum status: ['agendado', 'liberado_para_retorno', 'cancelado', 'finalizado_sem_retorno']

    validates :name, presence: true
    validates :cpf, cpf: true, presence: true, unless: :cnpj_present?
    validates :cnpj, cnpj: true, presence: true, if: :cnpj_present?

    validates :telephone, presence: true
    validates :email, email: true, presence: true, unless: :with_address?
    validates_date :date, presence: true
    validates :hour, presence: true

    validates :city_agenda_id, presence: true, if: :with_address?
    validates :address_agenda, presence: true, if: :with_address?

    validate :unique_schedule, on: :create, unless: :cnpj_present?
    validate :unique_schedule, on: :create, unless: :address_present?
    validate :unique_schedule_cnpj, on: :create, if: :cnpj_present?
    validate :validate!, on: :create
    #validate :unique_schedule_finance, on: :create, if: :address_present?

    validate :restriction!, on: :create, if: :restriction_enabled?

    validates :observation, :status, presence: true, on: :update

    def protocol
      "AG#{self.id}/#{self.created_at.strftime('%Y')}"
    end

    private

    def with_address?
      self.agenda.program_id == 8
    end

    def cnpj_present?
      self.cnpj.present? || !self.cnpj.to_s.empty?
    end

    def address_present?
      self.address_agenda.present? || !self.address_agenda.to_s.empty?
    end

    def restriction_enabled?
      agenda.existente? || agenda.inexistente?
    end

    def restriction!

      if !cnpj_present?
        if agenda.existente?
          if !Schedule::AgendaSchedule.find_by_sql("#{agenda.restriction_sql} AND cpf = '#{self.cpf}'").present?
            errors.add(:cpf, 'este CPF não tem permissão de participar desta agenda')
          end
        end

        if agenda.inexistente?
          if Schedule::AgendaSchedule.find_by_sql("#{agenda.restriction_sql} AND cpf = '#{self.cpf}'").present?
            errors.add(:cpf, 'este CPF não tem permissão de participar desta agenda')
          end
        end
      else
        if !Entity::Cadastre.complete.where(cnpj: self.cnpj).present?
          errors.add(:cnpj, 'este CNPJ ainda não completou o recadastramento, favor acessar a área de recadastramento de entidade e verificar as pendências.')
        end
      end
    end

    def validate!
      if self.date.present?
        if agenda.disable_dates.present? && agenda.disable_dates.to_s.split(';').include?(self.date.strftime("%d/%m/%Y").to_s)
          errors.add(:date, 'data não disponível')
        end

        hour = self.hour.strftime('%H:%M') rescue '00:00'

        if !agenda.hours(self.date).include? hour
          errors.add(:hour, 'horário não disponível')
        end
      end
    end

    def unique_schedule_cnpj

      if agenda.agenda_schedules.where("cnpj = ? AND status = 0 AND date >= ?", cnpj, Date.today).present?
        errors.add(:cnpj, 'este CNPJ já se encontra agendado, favor verificar')
      end

      if agenda.agenda_schedules.where("cnpj = ? AND status = 3", cnpj).present?
        errors.add(:cnpj, 'este CNPJ já foi atendido, em caso de dúvidas entre em contato com a Codhab')
      end

    end

    def unique_schedule_finance
      agenda_new = agenda.agenda_schedules.where("address_agenda = ? ", self.address_agenda)
      if agenda_new.present?
        if agenda_new.where("cpf <> ?", self.cpf).present?
          errors.add(:cpf, 'Endereço já possui agendamento com outro CPF.')
        end

      end

    end

    def unique_schedule
      if agenda.agenda_schedules.where("cpf = ? AND status = 0 AND date >= ?", self.cpf, Date.today).present?
        errors.add(:cpf, 'este CPF já se encontra agendado, favor verificar')
      end

      if agenda.agenda_schedules.where("cpf = ? AND status = 3", self.cpf).present?
        errors.add(:cpf, 'este CPF já foi atendido, em caso de dúvidas entre em contato com a Codhab')
      end

    end
  end
end
