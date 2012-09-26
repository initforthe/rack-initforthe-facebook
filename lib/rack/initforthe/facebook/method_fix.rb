module Rack
  module Initforthe
    module Facebook
      class MethodFix
        def initialize(app, options = {})
          @app = app
        end

        def call(env)
          request = Request.new(env)
          if !request.params['signed_request'].nil? && env['REQUEST_METHOD'] == 'POST'
            env['REQUEST_METHOD'] = 'GET'
          end
          @app.call(env)
        end
      end
    end
  end
end
