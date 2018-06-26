require_dependency 'document/application_controller'

module Document
  class AllotmentsController < ApplicationController

    before_action :set_allotment, only: [:print_one, :print_two, :print_three, :print_correction]

    def validate
      order = params[:order].present? ? params[:order] : params[:o]
      if order.present?
        redirect_to confirm_path(id: params[:id], order: order)
      else
        session[:id] = params[:id]
        @validate = Document::Validate.new
      end
    end

    def validation
      @validate = Document::Validate.new(set_params)
      if @validate.valid?
        redirect_to confirm_path(id: @validate.id)
      else
        render :validate
      end
    end

    def confirm
      @doc = Core::Document::DataPrint.find(params[:id])
      if @doc.allotment.main.present? || @doc.allotment.first.present? || @doc.allotment.second.present?
        order = params[:order].present? ? params[:order] : params[:o]
        case order
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
        when "4"
          @date       = "Em #{@doc.allotment.third_authenticate_date.strftime('%d/%m/%Y - %H:%M:%S')}" rescue nil
          @user       = @doc.allotment.third.name rescue "Documento não assinado"
          @complement = @doc.allotment.third.curriculum rescue nil
        when "5"
          @date       = "Em #{@doc.allotment.fourth_authenticate_date.strftime('%d/%m/%Y - %H:%M:%S')}" rescue nil
          @user       = @doc.allotment.fourth.name rescue "Documento não assinado"
          @complement = @doc.allotment.fourth.curriculum rescue nil
        when "6"
          @date       = "Em #{@doc.allotment.fifth_authenticate_date.strftime('%d/%m/%Y - %H:%M:%S')}" rescue nil
          @user       = @doc.allotment.fifth.name rescue "Documento não assinado"
          @complement = @doc.allotment.fifth.curriculum rescue nil
        end
        session.delete(:id)
      else
        @message = "O documento não foi assinado."
      end
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

    def set_params
      params.require(:validate).permit(:cpf, :document_date, :allotment_id)
    end

    def set_allotment
      @doc = Core::Document::DataPrint.find(params[:id])
      @allotment = Core::Document::Allotment.find(@doc.allotment_id)
    end

  end
end
