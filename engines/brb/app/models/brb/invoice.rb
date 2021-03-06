module Brb
  class Invoice < ActiveRecord::Base

    self.table_name = 'extranet.brb_invoices'
    
    belongs_to :category
    belongs_to :state, class_name: "Address::State"

    scope :paids, -> { where(status: 1)}

    enum status: ['não pago', 'pagamento realizado']
    enum invoice_type: ['guia_simples', 'boleto']

    validates :due, :category, :cpf, :name, :value, presence: true
    validates :cpf, cpf: true

    after_create :generate_invoice!, if: 'self.boleto?'
    after_create :generate_simple_invoice!, if: 'self.guia_simples?'

    scope :by_name, -> (name) {where('name ilike ?' "%#{name}%")}
    scope :by_cpf, -> (cpf) {where(cpf: cpf)}
    scope :by_type, -> (type) {where(invoice_type: type)}
    scope :by_status, -> (status) {where(status: status)}
    scope :by_category, -> (category) {where(category_id: category)}
    scope :by_date_start, -> (date_start) { where("brb_invoices.created_at::date >= ?", Date.parse(date_start))}
    scope :by_date_end, -> (date_end) { where("brb_invoices.created_at::date <= ?", Date.parse(date_end))}

    private

    def generate_simple_invoice!
      barcode = Brb::CreatingSimpleBarcodeService.new({
        due: self.due.strftime("%d/%m/%Y"),
        value: self.value,
        sequential: self.id
      })

      self.update({
        barcode: barcode.barcode_without_format,
        barcode_with_format: barcode.barcode_with_format,
        value: self.value,
        our_number: barcode.sequential,
        document_number: barcode.sequential
      })
    end

    def generate_invoice!
      barcode = Brb::CreatingBarcodeService.new({
        due: self.due.strftime("%d/%m/%Y"),
        value: self.category.default_value,
        sequential: self.id,
        bank_wallet: 1,
        bank_agency: 208,
        bank_account: '0149304'
      })
=begin
      @bank_wallet  = options[:bank_wallet]     ||= '1'
      @sequential   = options[:sequential]      ||= '1'
      @bank         = options[:bank]            ||= '070'
      @bank_agency  = options[:bank_agency]     ||= '058'
      @bank_account = options[:bank_account]    ||= '6002006'

      @due          = options[:due]             ||= '0'
      @coin         = options[:coin]            ||= '9'
      @value        = options[:value]           ||= 100
=end
      self.update({
        barcode: barcode.barcode_with_digit,
        barcode_with_format: barcode.barcode_with_regex,
        value: self.category.default_value,
        our_number: barcode.our_number_with_digits,
        document_number: barcode.sequential
      })
    end
  end
end