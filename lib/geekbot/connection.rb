module Geekbot
  module Connection
    def connection
      @connection ||= Faraday.new(faraday_options) do |conn|
        conn.request :json
        conn.response :json
        conn.adapter Faraday.default_adapter
      end
    end

    private

    def faraday_options
      {
        url:     faraday_url,
        headers: faraday_headers
      }
    end

    def default_headers
      {
        'Accept' => 'application/json',
        'User-Agent' => "Geekbot Ruby Gem #{Geekbot::VERSION}"
      }
    end

    def faraday_url
      @api_endpoint ||= ENV['GEEKBOT_API_ENDPOINT'] || 'https://api.geekbot.io'
    end

    def faraday_headers
      return default_headers unless access_token
      default_headers.merge(Authorization: access_token.to_s)
    end

    def access_token
      @access_token ||= ENV['GEEKBOT_ACCESS_TOKEN']
    end
  end
end
