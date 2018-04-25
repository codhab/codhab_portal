require_dependency "firm/application_controller"

module Firm
  class UserCompaniesController < ApplicationController
    before_action :validate_session!
    before_action :set_user_companies, only: [:index, :create, :destroy, :update]
    before_action :set_user_company, only: [:edit, :destroy, :update]
    before_action :set_tab

    def index

    end

    def new
      @user_company = Firm::UserCompany.new
    end

    def show

    end

    def edit
    end

    def update
      authorize @user_company
      @user_company.update(user_company_params)
    end

    def create
        @user_company = Firm::UserCompany.new(user_company_params)
        @user_company.company_id = @firm.company_id
        @user_company.save
    end

    def destroy
      @user_company = Firm::UserCompany.where(id: params[:id], company_id: @firm.company_id).first
      @user_company.destroy

      redirect_to action: :index
    end

    def refresh_token
      @company = @firm.company
      @company.set_token @firm
      @company.save

      redirect_to action: :index
    end

    private

     def validate_session!
        if session[:firm_auth_id].present? && session[:firm_expiration_id].present? && session[:firm_expiration_id] > Time.now
          @firm = Firm::UserCompany.find(session[:firm_auth_id])
        else
          redirect_to firm.new_authorization_path
        end
      end

    def user_company_params
      params.require(:user_company).permit(:name,:email,:login_user, :admin,
                                          :password, :password_confirmation,
                                          :company_id, :status)
    end


    def set_user_companies
      @user_companies = Firm::UserCompany.where(company_id: @firm.company_id)
    end

    def set_user_company
      @user_company = Firm::UserCompany.find(params[:id])
    end

    def set_tab
      @tab = 'user'
    end

  end
end
