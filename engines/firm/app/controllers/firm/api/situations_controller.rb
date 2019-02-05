require_dependency 'firm/api/api_controller'

module Firm
  module Api
    class SituationsController < ApiController # :nodoc:

      def index
        start_date = Date.parse(params[:start_date])
        end_date = Date.parse(params[:end_date])
        enterprise = params[:enterprise].present? ? params[:enterprise] : current_company.enterprise_ids

        last = current_company.enterprise_cadastres.where(id:
             Core::Candidate::EnterpriseCadastre.where(enterprise_id: current_company.enterprise_ids)
                                                .select('MAX(candidate_enterprise_cadastres.id)')
                                                .group('candidate_enterprise_cadastres.cadastre_id'))


        @dropouts = current_company.enterprise_cadastres.where('candidate_enterprise_cadastres.id in (?) and inactive_date >= ? and inactive_date <= ? and candidate_enterprise_cadastres.enterprise_id in (?)', last.ids, start_date ,end_date, enterprise).order(:inactive_date)
      end

      def create
        @enterprise_cadastre = current_company.enterprise_cadastres.find(params[:enterprise_cadastre_id]) rescue nil

        if @enterprise_cadastre.present?

          @enterprise_situation = @enterprise_cadastre.enterprise_cadastre_situations.new(
             enterprise_cadastre_id: params[:enterprise_cadastre_id],
             observation:  params[:observation],
             enterprise_cadastre_status_id: params[:enterprise_cadastre_status_id],
             file_path: params[:file_path],
             type_action: params[:type_action].to_s,
             enterprise_situation_action_id: params[:enterprise_situation_action_id],
             success: params[:success]
          )

          if @enterprise_situation.save
            if @enterprise_situation.enterprise_situation_status.waiver == true
              @enterprise_cadastre.update(inactive: true, inactive_date: Date.today)
            end

            render json: { status: "success", code_reference: @enterprise_situation.id }
          else
            render json: { status: "error", error: @enterprise_situation.errors }
          end

        else
          render json: { status: "error", error: ":enterprise_cadastre_id não pode ser vazio" }
        end

      end

      private

      def enterprise_status_params
        params.require(:enterprise_cadastre_situation).permit(:enterprise_cadastre_id,:observation,
                                                              :enterprise_cadastre_status_id,:file_path,
                                                              :type_action, :enterprise_situation_action_id,
                                                              :success)
      end

    end
  end
end
