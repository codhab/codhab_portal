require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class CadastresController < ApplicationController # :nodoc:
    layout 'layouts/social_work_cadastre/application'

    before_action :set_cadastre, only: [:edit, :destroy, :update]

    def index
      @cadastres = Core::SocialWorkCadastre::Cadastre.all

    end

    def new
      @cadastre = Core::SocialWorkCadastre::Cadastre.new
    end

    def show
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(session[:current_external_company_id])
      @cadastre_titulars = @cadastre.cadastre_titulars
      @cadastre_members = @cadastre.cadastre_members
      @upload_documents = @cadastre.upload_documents
      @step = @cadastre.steps.new

      @doc = Core::SocialWorkCadastre::DocumentType.where(status: true, required: true)
      @doc_sicaf = Core::SocialWorkCadastre::DocumentType.where(sicaf: false, status: true)
      @up_doc = @cadastre.upload_documents.map(&:document_type_id).sort
      @up_doc << 20 if @cadastre.uf != "7"
      @compar = false
      @compar_sicaf = false
      if @up_doc.present?
        @compar = true
        @compar_sicaf = true
        @doc_sicaf.ids.each do |v|
          @compar_sicaf = false unless @up_doc.include?(v)
        end
        @doc.ids.each do |v|
          @compar = false unless @up_doc.include?(v)
        end
      end
    end

    def create
      @cadastre = Core::SocialWorkCadastre::Cadastre.new(set_params)
      @cadastre.declaration_1 = false
      @cadastre.declaration_2 = false
      @cadastre.declaration_3 = false
      @cadastre.declaration_4 = false
      @cadastre.confirm = false
      @cadastre.situation = 0
      @cadastre.sicaf = false
      @cadastre.assignment = 2019

      @number = Core::SocialWorkCadastre::Cadastre.where(assignment: 2019).count
      @cadastre.number = @number + 1

      if @cadastre.save
        begin
          SocialWorkCadastre::ConfirmationCadastreMailer.completed_data(@cadastre).deliver_now!
        rescue
        end
        session[:current_external_company_id] = @cadastre.id
        flash[:success] = t :success
        redirect_to cadastre_path(session[:current_external_company_id], q: 'e')
      else
        render action: :new
      end
    end

    def situation
	    @cadastre = Core::SocialWorkCadastre::Cadastre.find(params[:id])
	    @cadastre.situation = params[:situation]
		 	@cadastre.save
    end

    def update
      @cadastre.update(set_params)
      @cadastre.destroy_step(@cadastre)
    end

    def update_sicaf
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(params[:id])
      @cadastre.sicaf = params[:sicaf]
      if @cadastre.save
        redirect_to cadastre_path(session[:current_external_company_id], q: 'd', anchor: 'sicaf')
      end
    end

    def update_declaration
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(params[:id])
      @cadastre.declaration_1 = true
      @cadastre.declaration_2 = true
      @cadastre.declaration_3 = true
      @cadastre.declaration_4 = true
      @cadastre.save
    end

    def update_confirm
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(params[:id])
      @cadastre.confirm = true
      @cadastre.save
    end

    def cities_by_state
      state = params[:id].to_i
      render json: @cities = Address::City.where(state_id: state).order(:name)
    end

    def edit
    end

    def destroy
      if @cadastre.destroy
        redirect_to action: :index
      end
    end

    private

    def set_params
      params.require(:social_work_cadastre_cadastre).permit(:crea_cau, :assignment, :social_reason, :crea, :cnpj, :address,
                                       :cep, :uf, :telephone, :celphone, :email,
                                       :city_id, :district, :sicaf,
                                       :technological_resources, :password,
                                       :declaration_1, :declaration_2,
                                       :declaration_3, :declaration_4, :order, :confirm)
    end

    def set_cadastre
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(params[:id])
    end
  end
end
