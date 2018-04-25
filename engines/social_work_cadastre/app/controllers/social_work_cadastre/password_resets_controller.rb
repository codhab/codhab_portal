require_dependency 'social_work_cadastre/application_controller'

module SocialWorkCadastre
  class PasswordResetsController < ApplicationController # :nodoc:
    layout 'layouts/social_work_cadastre/application'
    before_action :get_user,   only: %i[edit update]
    before_action :valid_user, only: %i[edit update]
    before_action :check_expiration, only: %i[edit update]


    def new; end

    def create
      @user = Core::SocialWorkCadastre::Cadastre.find_by(email: params[:password_reset][:email].downcase, cnpj: params[:password_reset][:cnpj])
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'Enviamos um email com instruções para alteração de sua senha.'
    end

    def edit; end

    def update
      if params[:social_work_cadastre_cadastre][:password].empty?
        @user.errors.add(:password, 'Não pode ficar vazio')
        render 'edit'
      elsif params[:social_work_cadastre_cadastre][:password] != params[:social_work_cadastre_cadastre][:password_confirmation]
        @user.errors.add(:password, 'Confirmação está diferente da senha.')
        render 'edit'
      elsif @user.update_attributes(user_params)
        flash[:success] = 'Senha alterada com sucesso'
        redirect_to new_session_path
      else
        render 'edit'
      end
    end

    private

    def user_params
      params.require(:social_work_cadastre_cadastre).permit(:password, :password_confirmation)
    end

    def get_user
      @user = Core::SocialWorkCadastre::Cadastre.find_by(activation_digest: params[:id])
    end

    def valid_user
      unless @user.present?
        redirect_to new_session_path
      end
    end

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = 'Tempo de alteração expirado'
        redirect_to new_session_path
      end
    end
  end
end
