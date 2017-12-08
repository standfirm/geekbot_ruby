require_relative 'connection'
require_relative 'client/v1'

module Geekbot
  module Client
    class << self
      def connect(access_token = ENV['GEEKBOT_ACCESS_TOKEN'])
        V1.new(Connection.new(access_token))
      end
    end
  end
end
