require 'geekbot/api_methods'
require 'geekbot/connection'
require 'geekbot/response'

module Geekbot
  class Client
    include ApiMethods
    include Connection

    def initialize(access_token: nil)
      @access_token = access_token
    end

    def get(path, params = nil, headers = nil)
      request(:get, path, params, headers)
    end

    def post(path, params = nil, headers = nil)
      request(:post, path, params, headers)
    end

    def put(path, params = nil, headers = nil)
      request(:put, path, params, headers)
    end

    def patch(path, params = nil, headers = nil)
      request(:patch, path, params, headers)
    end

    def delete(path, params = nil, headers = nil)
      request(:delete, path, params, headers)
    end

    private

    def request(method, path, params, headers)
      Geekbot::Response.new(connection.send(method, path, params, headers))
    end
  end
end
