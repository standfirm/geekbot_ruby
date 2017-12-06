module Geekbot
  module ApiMethods
    def teams(params = nil, headers = nil)
      get('/v1/teams', params, headers)
    end
  end
end
