module Rack
  module Initforthe
    module Facebook
      class AppDataRedirect
        def initialize(app, options = {})
          @app = app
        end

        def call(env)
          signed_params = env['facebook.signed_request'] || {}
          url = signed_params['app_data'].to_s
          if url[0] == '/'
            # Not sure what status code is applicable here really, this seems closest.
            [303, { 'Location' => url }, ['Redirecting']]
          else
            @app.call(env)
          end
        end
      end
    end
  end
end
