require_dependency 'social_work/application_controller'

module SocialWork
  class CompanyUsersController < ApplicationController
    before_action :set_company
    before_action :set_company_users
    before_action :set_company_user, only: [:show, :update, :edit, :destroy]


    def index
    end

    def new
      @company_user = @company.company_users.new
    end

    def create
      @company_user = @company.company_users.new(set_params)
      @company_user.user_type = 0
      @company_user.save
    end

    def update
      @company_user.update(set_params)
    end

    def destroy
      @company_user.destroy
      flash[:success] =  t :success
      redirect_to action: :index
    end

    private


    def set_company
      @company = Core::SocialWork::Company.find(current_social_user.company_id)
    end

    def set_company_users
      @company_users =  @company.company_users
    end

    def set_params
      params.require(:social_work_company_user).permit(:name, :username, :password,
                                                       :password_confirmation, :status)
    end

    def set_company_user
      @company_user =  @company.company_users.find(params[:id])
    end

  end
end
