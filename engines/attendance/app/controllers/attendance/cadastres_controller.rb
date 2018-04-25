
module Attendance
  class CadastresController < ApplicationController

    before_action :authenticate_cadastre!
    before_action :set_ticket, only: [:edit, :update]
    before_action :set_action, only: [:edit, :update]
    before_action :set_cadastre, only: [:edit, :update]
    before_action :set_cadastre_mirror, only: [:edit, :update]

    def index
      session[:context_id] = nil 
    end

    def edit
      @cadastre_mirror = Core::Attendance::CadastreForm.find(@cadastre_mirror.id)
    end

    def update
      @cadastre_mirror = Core::Attendance::CadastreForm.find(@cadastre_mirror.id)

      if @cadastre_mirror.update(set_params)
        redirect_to ticket_continue_cadastre_path(@ticket, @action)
      else
        render action: :edit
      end
    end

    def detail
      @cadastre = current_cadastre
    end

    def dependent
      @dependents = current_cadastre.dependents.where('kinship_id <> 6')
      @spouse = current_cadastre.dependents.where(kinship_id: 6).first
    end

    def pontuation
      @pontuations = current_cadastre.pontuations
    end

    def entity
      @entity = current_cadastre.old_candidates.last
    end

    def situation
      @situations = current_cadastre.cadastre_situations
    end

    def schedule
      @schedules = current_cadastre.schedules
    end

    def document
      @documents = current_cadastre.assessments
    end

    def address
      @address = current_cadastre.presenter.current_cadastre_address
    end

    def occurrence
      @iptus = current_cadastre.iptus
    end

    def indication
      @indications = current_cadastre.enterprise_cadastres
    end

    private

    def set_params
      params.require(:attendance_cadastre_form)
            .permit(:rg, :rg_org, :gender, :born, :born_uf,
                    :rg_uf, :place_birth, :mother_name, :special_condition_id,
                    :special_condition_type_id, :nis, :cid, :adapted_property,
                    :arrival_df)
    end

    def set_ticket
      @ticket = @cadastre.tickets.find(params[:ticket_id])
      @ticket = Core::Attendance::TicketPolicy.new(@ticket)
    end

    def set_action
      @action = @ticket.actions.find_by(context_id: 1)
    end

    def set_cadastre
      @cadastre = current_cadastre
    end

    def set_cadastre_mirror
      @cadastre_mirror = @cadastre.cadastre_mirrors.find(@ticket.cadastre_mirror_id)
    end

  end
end
