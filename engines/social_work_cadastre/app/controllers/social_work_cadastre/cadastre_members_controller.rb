require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class CadastreMembersController < ApplicationController

    before_action :set_cadastre
		before_action :set_cadastre_members
    before_action :set_cadastre_member, only: [:edit, :destroy, :update]

    def index
      @cadastre_members = @cadastre.cadastre_members
    end

    def new
      @cadastre_member = @cadastre.cadastre_members.new
    end

    def create
      @cadastre_member = @cadastre.cadastre_members.new(set_params)
      @cadastre_member.destroy_step(@cadastre)
        @cadastre_member.save
    end

    def update
     @cadastre_member.update(set_params)
     @cadastre_member.destroy_step(@cadastre)
    end

    def destroy
      if @cadastre_member.destroy
        @cadastre_member.destroy_step(@cadastre)
        redirect_to social_work_cadastre.show_path
      end
    end

    private

    def set_params
      params.require(:social_work_cadastre_cadastre_member).permit(:name, :formation, :rg, :cpf,
                                              :telephone, :celphone, :activite,
                                              :registration_crea, :cadastre_id)
    end

    def set_cadastre
      @cadastre = Core::SocialWorkCadastre::Cadastre.find(params[:cadastre_id])
    end

    def set_cadastre_member
      @cadastre_member = Core::SocialWorkCadastre::CadastreMember.find(params[:id])
    end

    def set_cadastre_members
      @cadastre_members = @cadastre.cadastre_members.all
    end
  end
end
