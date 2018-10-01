require_dependency 'entity/application_controller'

module Entity
  class CadastresController < ApplicationController
    before_action :set_http_support
    before_action :allow_iframe

    has_scope :by_situation
    has_scope :by_cnpj
    has_scope :by_name
    has_scope :by_acron
    has_scope :by_region

    def index

      @region_1 = ::Entity::Region.where(region_name: 'região 1').order(:name)
      @region_2 = ::Entity::Region.where(region_name: 'região 2').order(:name)
      @region_3 = ::Entity::Region.where(region_name: 'região 3').order(:name)
      @region_4 = ::Entity::Region.where(region_name: 'região 4').order(:name)
      @region_5 = ::Entity::Region.where(region_name: 'região 5').order(:name)

  
      region = params[:by_region]
      params[:by_region] = nil
      @cadastre = apply_scopes(::Entity::Cadastre).all.order(:name)
      
      params[:by_region] = region
      @cadastres = apply_scopes(::Entity::Cadastre).all.order(:name)

      respond_to do |format|
        format.html
        format.json {
          render json: @cadastres
        }
      end


    end

    def show
      @cadastre = ::Entity::Cadastre.find(params[:id])
      # byebug
      @candidates = @http.get("/entidade/candidatos.json?id=#{@cadastre.id}")
    end

    private

    def set_http_support
      server  = Rails.env.development? ? "http://localhost:3001" : "http://extranet.codhab.df.gov.br"
      @http   = HttpSupport.new(server, 'eed6a8780692be1675b1bd0f386ca8b0')
    end

    def allow_iframe
      response.headers.delete('X-Frame-Options')
    end
    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Request-Method'] = '*'
    end
  end
end
