require_dependency 'main/application_controller'

module Main
  class NoticiasController < ApplicationController
    before_action :add_cors_headers


      def index
        @noticias = Main::Post.where(publish: true, slider: false, local_post: 1).order("created_at DESC")
        @sliders = Main::Post.where(publish:true, slider: true, local_post: 1).order("created_at DESC")

        respond_to do |format|
          format.html
          format.json {
            render json: [posts: @noticias, sliders: @sliders]
          }
          # format.json { render :json => @noticias.to_json(:only => ["title","id","thumb,created_at,"])}
        end
      end

      def notice_midia
        @noticias = Main::Post.where(publish: true, slider: false, local_post: 1, post_category_id: 12).order("created_at DESC")
        @sliders = Main::Post.where(publish:true, slider: true, local_post: 1, post_category_id: 12).order("created_at DESC")

        respond_to do |format|
          format.html
          format.json {
            render json: [posts: @noticias, sliders: @sliders]
          }
          # format.json { render :json => @noticias.to_json(:only => ["title","id","thumb,created_at,"])}
        end
      end

      def mobile
        @noticias = Main::Post.where(publish: true, slider: false, local_post: 1).limit(0).order("created_at DESC")
        @sliders = Main::Post.where(publish:true, slider: true, local_post: 1).limit(0).order("created_at DESC")
        # @noticias = Main::Post.where(publish: true, slider: false, local_post: 1).limit(0).order("created_at DESC")
        # @sliders = Main::Post.where(publish:true, slider: true, local_post: 1).limit(0).order("created_at DESC")

        respond_to do |format|
          format.html
          format.json {
            render json: [posts: @noticias, sliders: @sliders]
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

      def set_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Request-Method'] = '*'
      end
  end
end
