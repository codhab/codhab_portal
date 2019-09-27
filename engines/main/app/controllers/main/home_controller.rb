require_dependency 'main/application_controller'

module Main
  class HomeController < ApplicationController

    def index

      if Date.current <= Date.parse('2017-07-03')
        if !params[:recadastre].present?
          redirect_to main_app.new_recadastre_path
        end
      end

      @service_results = Main::ServiceResult.where(status: true).order(:date)
      @posts = Main::Post.where(publish: true, slider: false, local_post: 1).limit(10).order("created_at DESC")
      @videos = Main::Video.where(publish: true).limit(5).order("created_at DESC")

      cookies[:recadastre_deny] = 'false'
    end

    def a
      redirect_to "/documento/validate?id=#{params[:id]}&order=#{params[:order]}"
    end

    # => pamila
    def d
      redirect_to "/documento/validate?id=#{params[:id]}&order=#{params[:order]}"
    end

    # => rafael
    def b
      redirect_to "/documento/document?id=#{params[:id]}&o=#{params[:o]}"
    end
    
    def e
      redirect_to '/entidades/validar/new'
    end
    
    def f
      redirect_to "/documento/document?id=#{params[:id]}&f=1"
    end


    def c
      redirect_to certificate.new_validation_path(id: params[:id])
    end

    def accreditation
    end

    def convenant
      @type_event = Main::TypeEvent.where(status: true)
      @events = Main::Event.where(status: true, type_event_id: 2)
    end

    def event
      @type_event = Main::TypeEvent.where(status: true)
      @events = Main::Event.where(status: true, type_event_id: 3)
    end

    def recognition
    end
  end
end
