require_dependency 'main/application_controller'

module Main
  class VideosController < ApplicationController

    def index
      @videos = Main::Video.where(publish:true).order(created_at: :desc)
    end

    def video_midia
      @videos = Main::Video.where(publish:true, post_category_id: 12).order(created_at: :desc)
    end


  end
end
