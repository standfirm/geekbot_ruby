module Geekbot
  module Client
    class V1
      def initialize(connection)
        @connection = connection
      end

      def teams
        res = @connection.get('/v1/teams/')
        Team.new(res.body)
      end

      def reports
        res = @connection.get('/v1/reports/')
        res.body.map { |b| Report.new(b) }
      end

      def standups
        res = @connection.get('/v1/standups/')
        res.body.map { |b| Standup.new(b) }
      end

      def standup(id)
        res = @connection.get("/v1/standups/#{id}")
        Standup.new(res.body)
      end

      def create_standup(params:)
        res = @connection.post('/v1/standups', params)
        Standup.new(res.body)
      end

      def update_standup(id:, params:)
        res = @connection.patch("/v1/standups/#{id}", params)
        Standup.new(res.body)
      end

      def replace_standup(id:, params:)
        res = @connection.put("/v1/standups/#{id}", params)
        Standup.new(res.body)
      end

      def destroy_standup(id:)
        res = @connection.delete("/v1/standups/#{id}")
        Standup.new(res.body)
      end
    end
  end
end
