module Candidate
  class ListsController < ApplicationController # :nodoc:
    before_action :set_http_support
    before_action :set_list, only: [:show]

    has_scope :by_cpf
    has_scope :by_name

    def index
      @lists = Core::Candidate::List.all.order(:created_at)
    end

    def show
      
      if @list.slug == 'convocados'
        @list.view_target = "::Candidate::View::GeneralCandidate"
      else
        @list.view_target = "Core::View::GeneralPontuation"
      end

      @general       = "#{@list.view_target}".constantize.includes([:cadastre, :situation_status]).where("#{@list.condition_sql}")

      @general_index = "#{@list.view_target}".constantize.select(:id).where("#{@list.condition_sql}").map(&:id)
      params[:per_page] ||= 50
      @candidates = apply_scopes(@general).paginate(page: params[:page], per_page: params[:per_page])

      #.paginate(page: params[:page], per_page: params[:per_page])
      #@candidates = @http.get("/candidato/listas/#{params[:id]}.json", params)
    end

    def pre_enable
      @pre_enable_cadastres = apply_scopes(::Candidate::PreEnable).select(:name, :cpf, :total).order(total: :desc).paginate(page: params[:page], per_page: 50)
    end
    
    def pre_enable_complete
      @pre_enable_cadastres = apply_scopes(::Candidate::PreEnableComplete).select(:name, :cpf, :total).order(total: :desc).paginate(page: params[:page], per_page: 50)
    end
    
    def pre_enable_second
      @pre_enable_cadastres = apply_scopes(::Candidate::PreEnableSecond).select(:name, :cpf, :total).order(total: :desc).paginate(page: params[:page], per_page: 50)
    end

    private

    def set_http_support
      server  = Rails.env.development? ? "http://localhost:3001" : "http://extranet.codhab.df.gov.br"
      @http = HttpSupport.new(server, 'eed6a8780692be1675b1bd0f386ca8b0')
    end

    def set_list
      @list = Core::Candidate::List.friendly.find(params[:id])
    end
  end
end
