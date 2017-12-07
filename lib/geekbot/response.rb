module Geekbot
  class Response
    def initialize(response)
      @raw_body    = response.body
      @raw_headers = response.headers
      @raw_status  = response.status
    end

    def body
      @raw_body
    end

    def headers
      @headers ||= @raw_headers.inject({}) do |result, (key, value)|
        result.merge(key.split('-').map(&:capitalize).join('-') => value)
      end
    end

    def status
      @raw_status
    end
  end
end
