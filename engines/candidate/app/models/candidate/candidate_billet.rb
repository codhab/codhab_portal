require 'concourse/application_controller'
require 'barby'
require 'barby/barcode/code_25_interleaved'
require 'barby/outputter/png_outputter'

module Candidate
  class CandidateBillet
    include ActiveModel::Model
    
    attr_accessor :cpf, :billet_id

    validates :cpf, cpf: true, presence: true
    validate  :cpf_exist?


    def billet
      ::Candidate::SimpleBrb.find(self.billet_id) rescue nil
    end

    def generate_billet!
      
      if self.valid?

        @category = Brb::Category.find(14)

        @invoice = Brb::Invoice.new({
          cpf: current_candidate.cpf,
          category_id: @category.id,
          name: current_candidate.name,
          value: @category.default_value,
          due: (Date.today + 10.days).strftime("%d/%m/%Y"),
          invoice_type: 0
        })

        if @invoice.save 
          barcode = Barby::Code25Interleaved.new(@invoice.barcode)
          File.open("public/uploads/barcodes/#{barcode}.png", 'wb') { |f| f.write barcode.to_png(xdim: 1,height: 50) }
        end 

        self.billet_id = @invoice.id

      end 
    end

    private

    def cpf_exist?
      errors.add(:cpf, "CPF não encontrado na base de dados da CODHAB") if current_candidate.nil?
    end

    def current_candidate
      ::Candidate::Cadastre.find_by(cpf: self.cpf) rescue nil
    end

  end
end