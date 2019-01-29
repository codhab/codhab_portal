require_dependency 'social_work/application_controller'

module SocialWork
  class CandidateSchedulesController < ApplicationController

    before_action :set_candidate_schedule,  only: [:show, :edit, :update]

    has_scope :by_name
    has_scope :by_cpf

    def index
      if current_social_user.company_id == 34
        city = 825
      else
        city = 835
      end
      @candidates = Core::SocialWork::CandidateSchedule.where(city_id: city).order(id: :asc)
      @candidates = apply_scopes(@candidates).paginate(:page => params[:page], :per_page => 20)
      @cand = Core::SocialWork::Candidate.where(cpf: @candidates.map(&:cpf))
      @pro = Core::SocialWork::CandidateProject.where(candidate_id: @candidates.map(&:id))
      @sit = Core::SocialWork::StepProject.select('MAX(id)').where(candidate_project_id: @pro.map(&:id)).group(:candidate_project_id)
      @situation = Core::SocialWork::StepProject.where(id: @sit, candidate_project_id: @pro.map(&:id))

    end

    def new
      @candidate_schedule = Core::SocialWork::CandidateSchedule.new
    end

    def create
      @candidate_schedule = Core::SocialWork::CandidateSchedule.new(set_params)
      @candidate_schedule.company_id = current_social_user.company.id
      @candidate_schedule.attendance_station_id = current_social_user.company.station_id

      if @candidate_schedule.save
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    def edit; end

    def update
      if @candidate_schedule.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def show; end

    def destroy
      @candidate_schedule.destroy
      flash[:success] =  t :success
      redirect_to action: :index
    end

    def burgh
      city = params[:city_id]
      render json: @burgh = Core::Address::Burgh.where(city_id: city)
    end

    private

    def set_params
      params.require(:social_work_candidate_schedule).permit(:attendance_station_id,:name,:cpf,:email,:telphone,:address,:complement_address,:cep,:date,:hour,
                                                             :observation,:restrict,:restrict_sql,:city_id,:situation_id,:schedule_status_id, :priority, :burgh_id)
    end

    def set_candidate_schedule
      params[:id] = params[:id].present? ? params[:id] : params[:social_work_candidate_schedule][:id]
      @candidate_schedule = Core::SocialWork::CandidateSchedule.find(params[:id])
    end


  end
end
