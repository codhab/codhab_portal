require_dependency 'concourse/application_controller'

module Concourse
  class CertificatesController < ApplicationController
    layout 'shared/portal'

    def new
      @certificate = Concourse::Certificate.new
    end

    def create
      @certificate = Concourse::Certificate.new(set_params)

      if !@certificate.valid?
        render action: :new
      else
        @candidate = Concourse::Candidate.find(@certificate.candidate)
        render layout: 'layouts/patternfly/less-bootstrap'
      end
    end

    def show
    end

    private

    def set_params
      params.require(:certificate).permit(:candidate, :cpf)
    end

  end
end
