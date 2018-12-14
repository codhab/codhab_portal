require_dependency 'regularization/application_controller'

module Regularization
  class SolicitationsController < ApplicationController
    # has_scope :name_reg
    # has_scope :cpf
    # has_scope :date
    # has_scope :by_situation

    def index

      @solicitations = Core::Regularization::Solicitation.where(id: Core::Regularization::Solicitation.select("MIN(id)")
                                                          .group(:cpf)).order(created_at: :asc)


      @solicitations = @solicitations.paginate(page: params[:page], per_page: 50)
    end
  end
end
