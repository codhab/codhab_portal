module Candidate
  class BilletsController < ApplicationController
    
    def new
      @billet = Candidate::CandidateBillet.new
    end

    #http://extranet.codhab.df.gov.br/brb/boletos/1517?token=eed6a8780692be1675b1bd0f386ca8b0
    def create
      @billet = Candidate::CandidateBillet.new(set_params)

      if !@billet.valid?
        render action: :new
      else 
        @billet.generate_billet!
        render action: :new
      end
    end

    private

    def set_params
      params.require(:candidate_billet).permit(:cpf)
    end

  end
end