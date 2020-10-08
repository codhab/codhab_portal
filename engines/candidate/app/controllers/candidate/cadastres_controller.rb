module Candidate
  class CadastresController < ApplicationController # :nodoc:
    def show
      @cadastre = Core::Candidate::Cadastre.find(params[:id])
      @cadastre = Core::Candidate::CadastrePresenter.new(@cadastre)
      @cadastre_position = Core::Candidate::Cadastre.find(params[:id])
      @document = Core::Document::DataPrint.where(cpf: @cadastre.cpf, status: true).last
      @occurrences = Core::Candidate::CadastreOccurrence.where(cadastre_id: params[:id], solved: false, portal: true)
                                                        .distinct(:validation_id)

      @indication_exception = ['87416700191',
                                '68837194153',
                                '57842574120',
                                '00928333140',
                                '84657006134',
                                '80785093168',
                                '83141456100',
                                '25519310106',
                                '26705338172']
      @indication_exception = @indication_exception.include?(@cadastre.cpf)
    end

    def find_new
      @search = Core::Candidate::Search.new
    end

    def find_show
      @search = Core::Candidate::Search.new(set_search_params)

      if @search.valid?
        redirect_to cadastre_path(@search.cadastre_id)
      else
        render action: :find_new
      end
    end

    def ocurrences
      @occurrences = Core::Candidate::CadastreOccurrence.where(cadastre_id: params[:id])
                                                        .distinct(:validation_id)
    end

    def indication_explanation
      @indication = Core::Candidate::EnterpriseCadastre.find(params[:id])
    end

    private

    def set_search_params
      params.require(:candidate_search).permit(:cpf)
    end
  end
end
