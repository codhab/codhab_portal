require_dependency 'cpl/application_controller'

module Cpl
  class IframeController < ApplicationController
    after_action :set_iframe

    def concurrence
      if Rails.env.production?
        @url = "http://www.codhab.df.gov.br/concorrencia-virtual"
      else
        @url = "http://localhost:3000/concorrencia-virtual"
      end
    
    end

    def vconcurrence
      if !Rails.env.production?
        @url = "http://intranet.codhab.df.gov.br/externo/cpl"
      else
        @url = "http://localhost:3000/externo/cpl"
      end
          
    end

    private

    def set_iframe
      if Rails.env.production?
        response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM http://www.codhab.df.gov.br"
      else
        response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM http://localhost:3000"
      end
    end

  end
end