require_dependency 'entity/application_controller'

module Entity
  class EventsController < ApplicationController
    before_action :add_cors_headers
    has_scope :by_title

    def index
      @sliders = Slider.all
      @events = Event.all
    end

    def show
      @sliders = Entity::Slider.all
      @event = Entity::Event.find(params[:id])
      respond_to do |format|
        format.html
        format.json {
          render json: @event
        }
      end
    end

    private

    def add_cors_headers
      origin = request.headers["Origin"]
      unless (not origin.nil?) and (origin == "http://localhost" or origin.starts_with? "http://localhost:")
        origin = "http://www.codhab.df.gov.br/"
      end
      headers['Access-Control-Allow-Origin'] = origin
      headers['Access-Control-Allow-Methods'] = 'POST, GET'
      allow_headers = request.headers["Access-Control-Request-Headers"]
      if allow_headers.nil?
        #shouldn't happen, but better be safe
        allow_headers = 'Origin, Authorization, Accept, Content-Type'
      end
      headers['Access-Control-Allow-Headers'] = allow_headers
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Max-Age'] = '1728000'
    end

    def search
    end

  end
end
