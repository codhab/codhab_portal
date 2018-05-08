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
  end
end