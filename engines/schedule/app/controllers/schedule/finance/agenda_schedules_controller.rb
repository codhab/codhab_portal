require_dependency 'schedule/application_controller'

module Schedule
  module Finance
    class AgendaSchedulesController < ApplicationController


      def index
        redirect_to action: 'new'
      end

      def new
        @schedule = Schedule::AgendaSchedule.new
      end

      def create
        @schedule = Schedule::AgendaSchedule.new(set_params)

        if @schedule.save
          session[:schedule_id] = @schedule.id
          redirect_to action: 'success'
        else
          render action: 'new'
        end
      end

      def success
        if session[:schedule_id].present?
          @schedule = Schedule::AgendaSchedule.find(session[:schedule_id])
        else
          redirect_to action: 'new'
        end
      end

      def edit
      end

      def update
      end


      private

      def set_params
        params.require(:agenda_schedule).permit(:date, :hour, :agenda_id, :name, :cpf, :document_number, :telephone, :telephone_optional, :celphone, :email,:observation, :city_agenda_id, :address_agenda)
      end

    end
  end
end
