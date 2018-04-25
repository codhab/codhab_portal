require_dependency 'schedule/application_controller'

module Schedule
  class AgendaInformationsController < ApplicationController

    def all
      if params[:id].present?
        @agenda = Schedule::Agenda.find(params[:id])

        if @agenda.start <= Date.today
          start_date = (Date.today + 1.days).strftime('%d/%m/%Y')
        else
          start_date = @agenda.start.strftime('%d/%m/%Y')
        end

        render json: [@agenda, start_date, @agenda.end.strftime("%d/%m/%Y")]
      else
        render json: 'not found'
      end
    end

    def hours
      if params[:id].present?
        @agenda = Schedule::Agenda.find(params[:id])
        render json: @agenda.hours(Date.parse(params[:date]))
      else
        render json: 'not found'
      end
    end
  end
end
