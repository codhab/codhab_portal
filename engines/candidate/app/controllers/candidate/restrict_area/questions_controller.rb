require_dependency 'candidate/application_controller'

module Candidate
  module RestrictArea
    class QuestionsController < ApplicationController
      before_action :authenticate_cadastre
      before_action :set_cadastre

      def index
        @questions = @cadastre.questions
        @tickets_ref = ::Candidate::CadastreReferences.where(cpf: @cadastre.cpf, code: 'convocation_1000')
      end
      
      def question_closed
        @questions = @cadastre.questions.where(ticket_id: params[:ticket_id])
        @ticket = @cadastre.tickets.find(params[:ticket_id])
      end

      def new
        @tickets_closed = ::Candidate::Ticket.where(cadastre_id: @cadastre.id, status: 0, status: 1)
        @question = @cadastre.questions.new
      end

      def edit
       authorize :question, :update?
      end

      def create

        @question = @cadastre.questions.new(question_params)
        @question.status = 0
        @question.been_read = false
        @question.question_type = 0
        if @question.save
          @question.add_ticket @cadastre
          redirect_to restrict_area_tickets_path
        else
          render :new
        end
      end

      def question_new
          @question = @cadastre.questions.new
          @questions = Question.where(ticket_id: params[:ticket_id])
          @ticket = @cadastre.tickets.find(params[:ticket_id])
      end

      def question_create
        @questions = Question.where(ticket_id: params[:ticket_id])
        @question = @cadastre.questions.new(question_params)
        @ticket = @cadastre.tickets.find(params[:ticket_id])
        @question.status = 0
        @question.been_read = false
        @question.question_type = 0
        @question.ticket_id = @ticket.id
        if @question.save

          redirect_to restrict_area_tickets_path
        else
          render :question_new
        end
      end

      # PATCH/PUT /questions/1
      def update

        if @question.update(question_params)
          redirect_to restrict_area_tickets_path
        else
          render :edit
        end
      end

      # DELETE /questions/1
      def destroy

        @question.destroy
        redirect_to questions_url, notice: 'Question was successfully destroyed.'
      end

      private

      def set_cadastre
        @cadastre = ::Candidate::Cadastre.find(session[:cadastre_id]) rescue nil
      end

      def http_support
        server  = Rails.env.development? ? "http://localhost:3001" : "http://extranet.codhab.df.gov.br"
        @http   = HttpSupport.new(server, 'eed6a8780692be1675b1bd0f386ca8b0')
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_question
        @question = Cms::Question.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def question_params
        params.require(:question).permit(:ticket_id, :subject_id, :staff_id,:message, :status, :attachment, :been_read, :question_type)
      end
    end
  end
end
