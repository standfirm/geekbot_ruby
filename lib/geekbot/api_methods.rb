# frozen_string_literal: true

module Geekbot
  module ApiMethods
    def index_teams(params: nil, headers: nil)
      get('/v1/teams', params, headers)
    end

    def index_reports(params: nil, headers: nil)
      get('/v1/reports', params, headers)
    end

    def index_standups(params: nil, headers: nil)
      get('/v1/standups', params, headers)
    end

    def show_standup(id:, params: nil, headers: nil)
      get("/v1/standups/#{id}", params, headers)
    end

    def create_standup(params: nil, headers: nil)
      post('/v1/standups', params, headers)
    end

    def update_standup(id:, params: nil, headers: nil)
      patch("/v1/standups/#{id}", params, headers)
    end

    def replace_standup(id:, params: nil, headers: nil)
      put("/v1/standups/#{id}", params, headers)
    end

    def destroy_standup(id:, params: nil, headers: nil)
      delete("/v1/standups/#{id}", params, headers)
    end
  end
end
