require_dependency 'cpl/application_controller'

module Cpl
  class ParticipantsController < ApplicationController # :nodoc:
    def new
      @participant = Cpl::Participant.new
    end

    def create
      @participant = Cpl::Participant.new(set_params)
      if @participant.save
        redirect_to  notices_path
      else
        render action: :new
      end
    end

    private

    def set_params
      params.require(:participant).permit(:name, :cnpj, :cpf, :email, :telephone,
                                          :celphone, :password, :status, :password_confirmation)
    end
  end
end
