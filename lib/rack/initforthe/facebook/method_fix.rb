require "rack-initforthe-facebook/version"

module Rack
  module Initforthe
    module Facebook
      class MethodFix
        def initialize(app, options = {})
          @app = app
        end

        def call(env)
          if env['facebook.signed_request'] && env['REQUEST_METHOD'] == 'POST'
            env['REQUEST_METHOD'] = 'GET'
          end
          @app.call(env)
        end
      end
    end
  end
end
