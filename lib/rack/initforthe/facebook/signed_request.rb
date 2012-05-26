module Rack
  module Initforthe
    module Facebook
      class SignedRequest
        def initialize(app, options = {})
          @app = app
        end

        def call(env)
          request = Request.new(env)
          if request.params['signed_request']
            env['facebook.signed_request'] = parse_signature(request.params['signed_request'])
          end
          @app.call(env)
        end

        def parse_signature(signed_request)
          signature, data = signed_request.split('.', 2)
          data << '=' while data.length % 4 > 0
          JSON.parse(Base64.urlsafe_decode64(data))
        end
      end
    end
  end
end
