require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class DashboardController < ApplicationController # :nodoc:
    layout 'layouts/social_work_cadastre/application'

    def index; end
    def presentation; end
    def inform
      @page = Main::Page.find(params[:id])
    end

    def attach; end

    def result
      @locations = Core::SocialWorkCadastre::Location.all
    end
  end
end
