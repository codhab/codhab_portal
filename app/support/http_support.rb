class HttpSupport

  attr_accessor :connection

  def initialize(base_url, token)
    @token = token
    @connection = Faraday.new(url: base_url) do |faraday|
      faraday.request   :url_encoded
      faraday.response  :logger
      faraday.adapter   Faraday.default_adapter
      faraday.response :json, :content_type => /\bjson$/
    end  
  end

  def get(url, params = {})
    params = params.merge({token: @token})
    response = @connection.get url, params
    
    response.body
  end

  def post(url, params = {})
    params < { token: @token }
    @connection.post do |req|
      req.post url, params
      req.body
    end
  end


end
