require_dependency 'concourse/application_controller'

module Concourse
  class RefundsController < ApplicationController
    before_action :set_project, except: [:city]
    before_action :load_bank, except: [:city, :index]

    def index
      @refunds = @project.refunds
    end

    def new
      unless session[:candidate_id].present?
        new_project_validate_refund_path(@project)
      end
      @refund = @project.refunds.new
    end

    def create
      @refund = @project.refunds.new(set_params)
      @refund.candidate_id = session[:candidate_id]
      @refund.status = false
      if @refund.bank_number.present?
        bank_name = JSON.parse(open("https://www.pagueveloz.com.br/Api/v1/Bancos?Codigo=#{@refund.bank_number}").read, symbolize_names: true)
        @refund.bank_name = bank_name[:Nome]
      end
      if @refund.save
        Concourse::SubscribeMailer.refund(@candidate, @refund).deliver_now!

        flash[:success] = t :success
        session[:candidate_id] = nil
        redirect_to project_refunds_path(@project)
      else
        render action: :new
      end
    end

    def city
      state = params[:state_id]
      render json: @cities = Core::Address::City.where(state_id: state).order(:name)
    end

    private

    def load_bank
      @candidate = Concourse::Candidate.find(session[:candidate_id])
      @bank = JSON.parse(open("https://www.pagueveloz.com.br/Api/v1/Bancos").read, symbolize_names: true)
      @bank = @bank.sort_by{ |x| x[:Codigo].to_i }
    end

    def set_params
      params.require(:candidate_refund).permit(:account, :operation, :agency, :bank_number,
                                              :state_id, :city_id, :address, :account_type_id)
    end

    def set_project
      @project = Concourse::Project.friendly.find(params[:project_id])
    end
  end
end
