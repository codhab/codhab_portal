module Address
 class DocumentsController < ApplicationController


   def index

   end

   def new
    @document = Address::Document.new
   end

   def create
      @document = Address::Document.new(set_params)
      @cadastre = Candidate::Cadastre.find_by_cpf(@document.cpf.gsub('.','').gsub('-',''))

      if @cadastre.present?

        unless @cadastre.cadastre_address.present?
          flash[:warning] = "Candidato não possui vinculo com endereço."
          render :new
        else
          @unit = Address::Unit.find(@cadastre.cadastre_address.order(:created_at).last.unit_id)
          @candidate = Candidate::Cadastre.find(@unit.current_cadastre_address.cadastre_id)
          unless @unit.current_cadastre_address.present?
            flash[:warning] = "Endereço não possui vinculo com candidato."
            render :new
          end

          document_service = Address::PrintingDocumentService.new(@candidate)
          if !document_service.positive_certificate!
            flash[:warning] = "Ficha não pode ser emitida para esse cadastro."
            render :new
          else
            document_service.positive_certificate_log!
            @autenticate = "#{@candidate.current_cadastre_address.unit_id}#{@candidate.id}"
            @qr = ::PrintingQrcodeService.generate!(@candidate.current_cadastre_address.id)
            render layout: 'empty'
          end
        end

      else
        flash[:warning] = "Candidato não cadastrado na CODHAB."
        render :new
      end

    end

    def validate
      @document = Address::Document.new
    end

    def validate_show
      @document = Address::Document.new(set_params)
      if @document.valid?
        @candidate = Candidate::Cadastre.find_by_cpf(@document.cpf.gsub('.','').gsub('-',''))
        aut =  "#{@candidate.current_cadastre_address.unit_id}#{@candidate.id}"

        if aut == @document.authenticate && @candidate.current_cadastre_address.unit.control_number.to_s == @document.certificate_number
          @text = "Sua ficha é papo reto"
        else
          flash[:warning] = "Ficha descritiva não é válida"
          redirect_to address.validate_path
        end
      else
        render :validate
      end
    end

    def validate_doc
      @document = Address::Document.new
    end

    def validate_doc_show
      @document = Address::Document.new(set_params)

      if @document.valid?
        @candidate = Core::Candidate::Cadastre.find_by(cpf: @document.cpf.gsub('.','').gsub('-',''))
        @print = Core::Address::PrintUnitCadastre.where(cpf: @candidate.cpf, descriptive_type: 1).last
        if @print.present?
          if @print.unit_id == @document.authenticate.to_i
            redirect_to description_path(id: @candidate.id)
          else
            flash[:warning] = "Ficha descritiva não é válida"
            redirect_to address.validate_doc_path
          end
        else
          if @candidate.cadastre_activities.where(activity_status_id: 18).last.present?
            @unit = Core::Address::Unit.find(@document.authenticate.to_i)
            if @unit.current_candidate.id == @candidate.id
              redirect_to description_path(id: @candidate.id)
            else
              flash[:warning] = "Nenhum documento gerado para este documento."
              render :validate_doc
            end
          else
            flash[:warning] = "Nenhum documento gerado para este documento."
            render :validate_doc
          end

        end
      else
        render :validate_doc
      end
    end

    def description
      @candidate = Core::Candidate::Cadastre.find(params[:id])
    end

    def occupation
      @allot = Address::PrintUnitCadastre.joins(:print_allotment).where('address_print_unit_cadastres.unit_id = ? and address_print_allotments.status = true and  address_print_allotments.print_type_id = 2', params[:id]).order(:id).last

      if @allot.present?
        @allotment = Address::PrintAllotment.find(@allot.print_allotment_id)
        @presi = Person::Sector.find(2)
        @candidate = Candidate::Cadastre.find_by_cpf(@allot.cpf)
        render layout: 'document'
      else
        flash[:red] = 'Não existe arquivos para impressão.'
      end
    end

    def donate_unit
      @allot = Address::PrintUnitCadastre.joins(:print_allotment).where('address_print_unit_cadastres.unit_id = ? and  address_print_allotments.print_type_id = 3', params[:id]).order(:id).last

      if @allot.present?
        @allotment = Address::PrintAllotment.find(@allot.print_allotment_id)
        @presi = Person::Sector.find(2)
        @candidate = Candidate::Cadastre.find_by_cpf(@allot.cpf)
        render layout: 'document'
      else
        flash[:red] = 'Não existe arquivos para impressão.'
      end
    end





    def set_params
      params.require(:document).permit(:cpf, :authenticate, :certificate_number)
    end
 end
end
