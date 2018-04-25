require_dependency 'document/application_controller'

module Document
  class AllotmentsController < ApplicationController
    layout 'empty'


    before_action :set_allotment, only: [:print_one, :print_two, :print_three, :print_correction]

    def validate
      @doc = Core::Document::DataPrint.find(params[:id])
      if @doc.allotment.main.present? || @doc.allotment.first.present? || @doc.allotment.second.present?
        case params[:order]
        when "1"
          @date =       "Em #{@doc.allotment.main_authenticate_date.strftime('%d/%m/%Y - %H:%M:%S')}" rescue nil
          @user       = "GILSON PARANHOS" rescue "Documento não assinado"
          @complement = "Diretor-Presidente da CODHAB/DF" if @doc.allotment.main.present?
        when "2"
          @date       = "Em #{@doc.allotment.first_authenticate_date.strftime('%d/%m/%Y - %H:%M:%S')}" rescue nil
          @user       = @doc.allotment.first.name rescue "Documento não assinado"
          @complement = @doc.allotment.first.job.name rescue nil
        when "3"
          @date       = "Em #{@doc.allotment.second_authenticate_date.strftime('%d/%m/%Y - %H:%M:%S')}" rescue nil
          @user       = @doc.allotment.second.name rescue "Documento não assinado"
          @complement = @doc.allotment.second.job.name + ' - ' + @doc.allotment.second.sector_current.name rescue nil
        end
      else
        @message = "O documento não foi assinado."
      end
      render layout: 'application'
    end

    def print_one
      render layout: 'document'
    end

    def print_two
      render layout: 'document'
    end

    def print_three
      render layout: 'document'
    end


    def print_correction
      render layout: 'document'
    end

    def document
      @unit = Core::Address::Unit.where(id: params[:id], certificate: 'b').first
      @message = 'O documento não foi assinado.' unless @unit.present?
      render layout: 'application'
    end

    private

    def set_allotment
      @doc = Core::Document::DataPrint.find(params[:id])
      @allotment = Core::Document::Allotment.find(@doc.allotment_id)
    end

  end
end
