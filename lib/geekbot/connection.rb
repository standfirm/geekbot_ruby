require 'faraday'
require 'faraday_middleware'
require 'forwardable'
require_relative 'version'

module Geekbot
  class Connection
    extend Forwardable

    def_delegators :@connection, :get, :post, :put, :patch, :delete

    def initialize(access_token)
      @connection ||= Faraday.new(faraday_options) do |conn|
        conn.headers[:authorization] = access_token
        conn.request :json
        conn.response :json

        conn.adapter Faraday.default_adapter
      end
    end

    private

    def faraday_options
      {
        url:     ENV['GEEKBOT_API_ENDPOINT'] || 'https://api.geekbot.io',
        headers: { user_agent: "Geekbot Ruby Gem #{VERSION}" }
      }
    end
  end
end
