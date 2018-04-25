class SessionsController < ApplicationController
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers
  skip_before_action :verify_authenticity_token

  def authenticate
    @cadastre = ::Candidate::Cadastre.where(cpf: params[:cpf],
                                            password: params[:password]).first

    if @cadastre.present?
      render json: { data: { message: 'success', cpf: @cadastre.cpf } }
    else
      render json: { data: { message: 'error', cpf: params[:cpf], password: params[:password], params: params} }
    end

  end


  def create
    @cadastre = ::Candidate::Cadastre.find_by(cpf: params[:cpf]) rescue nil

    if @cadastre.present?
      session[:cadastre_id] = @cadastre.id
    end

  end


  def get_lat_lng

    begin
      @cadastre = ::Candidate::Cadastre.find_by(cpf: params[:cpf])
      @geo      = ::Candidate::CadastreGeolocation.new({
                    cadastre_id: @cadastre.id,
                    lat: params[:lat],
                    lng: params[:lng]
                  })
      @geo.save
      render json: {data: { message: 'success' }}
    rescue
      render json: {data: { message: 'error' }}
    end
  end

  def get_lat_lng_post

    begin
      @cadastre = ::Candidate::Cadastre.find_by(cpf: params[:cpf])
      @geo      = ::Candidate::CadastreGeolocation.new({
                    cadastre_id: @cadastre.id,
                    lat: params["_json"][0]["latitude"],
                    lng: params["_json"][0]["longitude"]
                  })
      @geo.save
      render json: {data: { message: 'success' }}
    rescue
      render json: {data: { message: 'error' }}
    end
  end
  private

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end
end
