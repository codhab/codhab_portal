require_dependency 'schedule/application_controller'

module Schedule
  module Finance
    class DataReferencesController < ApplicationController

      has_scope :city_agenda_id
      has_scope :block

      def index
        respond_to do |format|
          format.json {
            @address = apply_scopes(Schedule::DataReference).all
          }
        end
      end
    end
  end
end
